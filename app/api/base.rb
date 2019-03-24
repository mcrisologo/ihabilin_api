# frozen_string_literal: false

require 'grape'
require 'grape-entity'
require 'grape-swagger'
require 'doorkeeper/grape/helpers'

class Base < Grape::API
  include Grape::Kaminari

  # common Grape settings
  prefix 'api'
  version 'v1', using: :path
  format :json

  rescue_from :all, backtrace: false do |e|
    ExceptionNotifier.notify_exception(e) if Rails.env.staging? || Rails.env.production?
    Base.send_error_response(e)
  end

  helpers Doorkeeper::Grape::Helpers
  helpers ApiHelpers::Auths
  helpers ApiHelpers::HashConverter
  helpers ApiHelpers::Messages
  helpers ApiHelpers::Logs
  helpers ApiHelpers::Files
  helpers ApiHelpers::Params

  before do
    swaggered! || doorkeeper_authorize!

    @data = hash_to_param(params.except(:limit, :page, :per_page, :offset, :access_token))
    @data = parse_dates(@data)
    params[:page] = params[:page].to_i if params[:page]
    params[:per_page] = params[:per_page].to_i if params[:per_page]
    params[:offset] = params[:offset].to_i if params[:offset]

    set_paper_trail_meta
  end

  after do
    reset_paper_trail_meta
  end

  # ---- MOUNT AREA ---- start
  mount Info

  mount Users::API
  mount UserMessages::API
  # ---- MOUNT AREA ---- end

  add_swagger_documentation api_version: 'v1', hide_documentation_path: true, hide_format: true,
                            info: { title: 'Ihabilin API' }

  def self.send_error_response(e)
    case e
    when ActiveRecord::RecordNotFound
      status = 404
      msg = 'Not Found'
    when ArgumentError
      status = 400
      msg = 'Not Found'
    else
      status = 500
      msg = 'Internal Server Error. Check your parameters.'
    end
    msg << " -- EXCEPTION MSG: #{e.message}"
    Rack::Response.new({ 'status' => status, 'message' => msg }.to_json, status)
  end
end
