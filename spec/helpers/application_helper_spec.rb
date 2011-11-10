require 'spec_helper'

describe ApplicationHelper do
  describe "iphone_user_agent?" do
    before(:each) do
      self.request = helper.request
    end

    it "should return true if mobile safari" do
      helper.request.env["HTTP_USER_AGENT"] = 'Mobile/ +Safari'
      iphone_user_agent?.should be_true
    end

    it "should be false if no agent" do
      helper.request.env["HTTP_USER_AGENT"] = ''
      iphone_user_agent?.should be_false
    end

    it "should be false if wrong agent" do
      helper.request.env["HTTP_USER_AGENT"] = 'Firefox'
      iphone_user_agent?.should be_false
    end
  end
end
