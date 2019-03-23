# frozen_string_literal: true

module ApiHelpers
  module Params
    extend ::Grape::API::Helpers

    def parse_dates(data)
      date_list = %w[birth_date billed_on
                     from_date to_date
                     start_date end_date
                     time_start time_end
                     booking_schedule blocked_day schedule_day
                     oauth_expires_at cancelled_on
                     expiration_date expiration]
      state_list = %w[changed_state current_state]
      data.each do |key, value|
        data[key] = parse_date_array(value) if state_list.include?(key.to_s)
        next unless date_list.include?(key.to_s)
        next if value.blank?

        data[key] = Utilities::DateParsers::Default.perform(value)
      end

      data
    end

    def parse_date_array(data)
      result = []
      data.each do |list|
        result << parse_dates(list)
      end
      result
    end

    def parse_data(data)
      data.to_s.split(',').map(&:strip)
    end

    def parse_data_to_i(data)
      data.to_s.split(',').map(&:to_i)
    end
  end
end
