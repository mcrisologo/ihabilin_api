# frozen_string_literal: true

class Info < Grape::API
  namespace :info do
    desc 'Provides information about the API'
    get do
      { api: 'Ihabilin', version: version }
    end
  end
end
