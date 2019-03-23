# frozen_string_literal: true

module ApiHelpers
  module Auths
    extend ::Grape::API::Helpers

    def warden
      env['warden']
    end

    def swaggered!
      headers['Authorization'] == Rails.application.secrets.swagger_auth
    end

    def swaggered_user
      # integration user
      if headers['Cookie'].include?('_bckets_auth')
        cookie = headers['Cookie'].split(';').find { |data| data.include?('_bckets_auth') }
        auth = Users::Authentication.find_by(oauth_token: cookie.split('=').last)
        forbidden_request!('Auth does not exist') unless auth.present?
        user = auth.user
      end

      user ||= User.first
      user
    end

    def doorkeeper_user
      User.find_by(id: doorkeeper_token.resource_owner_id)
    end

    def mobile_auth!
      headers['Authorization'] == Rails.application.secrets.mobile_auth
    end

    def current_user
      # TODO
      # maybe setup a demo data
      @current_user ||= doorkeeper_user if doorkeeper_token
      @current_user ||= swaggered_user if swaggered!
      forbidden_request!('User does not exist') unless @current_user.present?

      @current_user
    end
  end
end
