require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Plato < OmniAuth::Strategies::OAuth2
      option :name, :plato

      option :client_options, {
          :site => "http://subscriptions.teachtci.com",
          :authorize_url => "http://subscriptions.teachtci.com/oauth/authorize"
      }

      uid { access_token.get('/api/v1/user.json').parsed["user"]["sysadmin"]["id"] }

      info do
        {
            :name => "TCI Syadmin",
            :user_type => "sysadmin",
            :customer_number => "TCI"
        }
      end
    end
  end
end