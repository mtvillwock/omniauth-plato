require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Plato < OmniAuth::Strategies::OAuth2
      option :name, :plato

      option :client_options, {
          :site => "http://subscriptions.teachtci.com",
          :authorize_url => "http://subscriptions.teachtci.com/oauth/authorize"
      }

      uid { raw_info["user"][staffer_type]["id"] }

      info do
        {
            :name => "#{staffer["first_name"]} #{staffer["last_name"]}",
            :user_type => staffer_type,
            :customer_number => raw_info["customer_number"]
        }
      end

      def staffer
        raw_info["user"][staffer_type]
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/user.json').parsed
      end

      def staffer_type
        raw_info["user"].keys.detect{|key| staffer_types.include?(key) }
      end

      private

      def staffer_types
        %w[teacher coordinator admin sysadmin]
      end
    end
  end
end