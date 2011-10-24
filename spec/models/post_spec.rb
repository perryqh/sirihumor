require 'spec_helper'

describe Post do
  describe 'validations' do
    should_validate_presence_of :screenshot
  end

  describe 'active_posts scope' do
    before(:each) do
      Factory.create(:post)
      @active_1 = Factory.create(:post, :active => true)
      Factory.create(:post, :active => false)
      @active_2 = Factory.create(:post, :active => true)
    end

    specify { Post.active_posts.all.should =~ [@active_1, @active_2]}

  end

  describe 'save attachment' do
    require 'mail'
    it "should set the attachment before validation" do
      message = Mail.new
      attachment = stub(:decoded => 'yahoo!', :filename => 'foo.png', :mime_type => 'png')
      message.stub(:attachments => [attachment])
      post = Factory.build(:post, :screenshot => nil, :message => message)

      post.valid?.should be_true
      post.screenshot.should_not be_nil
    end
  end
end
