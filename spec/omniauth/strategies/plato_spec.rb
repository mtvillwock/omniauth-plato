require 'omniauth/strategies/plato'

describe OmniAuth::Strategies::Plato do
  subject { OmniAuth::Strategies::Plato.new({}) }

  describe "client options" do
    it "has correct site" do
      subject.options.client_options.site.should eq("http://subscriptions.teachtci.com")
    end

    it "has correct authorize url" do
      subject.options.client_options.authorize_url.should eq("http://subscriptions.teachtci.com/oauth/authorize")
    end
  end
end