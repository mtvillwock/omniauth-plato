require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Plato < OmniAuth::Strategies::OAuth2
      option :name, :plato

      option :client_options, {
          :site => "http://subscriptions.teachtci.com",
          :authorize_url => "http://subscriptions.teachtci.com/oauth/authorize"
      }

      uid { raw_info[staffer_type]["id"] }

      info do
        {
            :name => "#{raw_info[staffer_type]["first_name"]} #{raw_info[staffer_type]["last_name"]}"
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/user.json').parsed
      end

      def staffer_type
        raw_info.keys.detect{|key| staffer_types.include?(key) }
      end

      private

      def staffer_types
        %w[teacher coordinator admin]
      end
    end
  end
end