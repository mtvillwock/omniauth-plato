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

  describe "name" do
    context "teacher" do
      it "should return first and last name from raw_info if available" do
        subject.stub!(:raw_info).and_return({"teacher" => {"first_name" => "John", "last_name" => "Kelly"}})
        subject.info.should == {:name => "John Kelly", :user_type => "teacher", :customer_number => nil}
      end
    end

    context "coordinator" do
      it "should return first and last name from raw_info if available" do
        subject.stub!(:raw_info).and_return({"coordinator" => {"first_name" => "John", "last_name" => "Kelly"}})
        subject.info.should == {:name => "John Kelly", :user_type => "coordinator", :customer_number => nil}
      end
    end

    context "admin" do
      it "should return first and last name from raw_info if available" do
        subject.stub!(:raw_info).and_return({"admin" => {"first_name" => "John", "last_name" => "Kelly"}})
        subject.info.should == {:name => "John Kelly", :user_type => "admin", :customer_number => nil}
      end
    end
  end

  describe "uid" do
    context "teacher" do
      it "should return uid from raw_info if available" do
       subject.stub!(:raw_info).and_return({"teacher" => {"id" => "9"}})
       subject.uid.should == "9"
     end
    end

    context "coordinator" do
      it "should return uid from raw_info if available" do
       subject.stub!(:raw_info).and_return({"coordinator" => {"id" => "9"}})
       subject.uid.should == "9"
     end
    end

    context "admin" do
      it "should return uid from raw_info if available" do
       subject.stub!(:raw_info).and_return({"admin" => {"id" => "9"}})
       subject.uid.should == "9"
     end
    end
  end

  describe "customer_number" do
    it "should return the customer number from the raw_info" do
      subject.stub!(:raw_info).and_return({"teacher" => {"customer_number" => "QWERTY12345"}})
      subject.info[:customer_number].should == "QWERTY12345"
    end
  end
end