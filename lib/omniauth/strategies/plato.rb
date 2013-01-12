require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Plato < OmniAuth::Strategies::OAuth2
      option :name, :plato

      option :client_options, {
        :site => "http://subscriptions.teachtci.com",
        :authorize_url => "http://subscriptions.teachtci.com/oauth/authorize"
      }

      uid { raw_info["teacher"]["id"] }

      info do
        {
          :email => raw_info["teacher"]["email"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/user.json').parsed
      end
    end
  end
end