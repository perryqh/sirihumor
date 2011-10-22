require 'spec_helper'

describe PostsController do
  describe "GET index" do
    it "should respond successfully" do
      get :index
      response.should be_success
      response.should render_template(:index)
    end

    it "should filter by active posts and order by create" do
      @post1 = Factory.create(:post)
      @post2 = Factory.create(:post, :active => true)
      @post3 = Factory.create(:post, :active => false)
      @post4 = Factory.create(:post, :active => true)

      get :index

      assigns(:posts).should == [@post2, @post4]
    end
  end

  describe "POST create" do
    it "should create inactive post" do
      mail = Mail.new
      mail.stub_chain(:attachments, :first).and_return(File.open('spec/testimage.gif'))
      Mail.should_receive(:new).and_return(mail)

      post :create

      response.should be_success
      assigns(:post).active.should be_false
    end

    it "should render 404 if invalid message" do
      post :create

      response.status.should == 404
    end
  end
end