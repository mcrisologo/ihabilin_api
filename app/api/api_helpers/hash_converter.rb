# frozen_string_literal: true

module ApiHelpers
  module HashConverter
    extend ::Grape::API::Helpers

    def hash_to_param(hash)
      result = {}
      keys = hash.keys
      keys.delete('fake')
      keys.delete('route_info')
      keys.delete('version')
      keys.delete('format')

      keys.each do |key|
        data = nil
        if hash[key.to_s].is_a?(Array)
          first = hash[key.to_s].first
          if first.is_a?(Hash) || first.is_a?(Hashie::Mash)
            data = []
            hash[key.to_s].each do |array_hash|
              data << hash_to_param(array_hash)
            end
          else
            data = hash[key.to_s]
          end
        elsif hash[key.to_s].is_a?(Hash) || hash[key.to_s].is_a?(Hashie::Mash)
          data = hash_to_param hash[key.to_s]
        else
          data = hash[key.to_s]
        end
        result.merge!(:"#{key.underscore}" => data) unless key.underscore.in?(%w[created_at updated_at])
      end
      result
    end

    def to_underscore(hash)
      convert hash, :underscore
    end

    def to_camel_case(hash)
      convert hash, :camelize, :lower
    end

    def convert(obj, *method)
      case obj
      when Hash
        obj.each_with_object({}) do |(k, v), h|
          v = convert v, *method
          h[k.send(*method)] = v
        end
      when Array
        obj.map { |m| convert m, *method }
      else
        obj
      end
    end
  end
end
