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

  describe "email" do
    it "should return email from raw_info if available" do
      subject.stub!(:raw_info).and_return({"teacher" => { "email" => "test@example.com"}})
      subject.info.should eq({:email => "test@example.com"})
    end
  end

  describe "uid" do
    it "should return uid from raw_info if available" do
      subject.stub!(:raw_info).and_return({"teacher" => { "id" => "9"}})
      subject.uid.should eq("9")
    end
  end
end