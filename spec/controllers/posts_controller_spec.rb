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

      assigns(:posts).should == [@post4, @post2]
    end
  end

  describe "GET new" do
    it "should render new template" do
      get :new

      response.should be_success
      response.should render_template(:new)
      assigns(:post).should_not be_nil
    end
  end

  describe "GET show" do
    it "should render show template" do
      apost = mock_model(Post)
      Post.should_receive(:find).with(apost.id.to_s).and_return(apost)
      get :show, :id => apost.id

      response.should render_template(:show)
      assigns(:post).should == apost
    end
  end

  describe "POST create" do
    it "should create post" do
      apost, params = mock_model(Post, :save => true), {}
      Post.should_receive(:new).with(params).and_return(apost)

      post :create, :post => params

      response.should redirect_to(post_url(apost.id))
    end

    it "should rerender new if invalid" do
      apost, params = mock_model(Post, :save => false), {}
      Post.should_receive(:new).with(params).and_return(apost)

      post :create, :post => params

      response.should render_template(:new)
    end
  end

  describe "POST create from Mail" do
    before(:each) do
      @thanks = stub(:deliver => true)
    end

    it "should create inactive post" do
      mail = stub
      post1 = Factory.build(:post)
      Mail.should_receive(:new).and_return(mail)
      Post.should_receive(:new).with(:active => true, :message => mail).and_return(post1)
      post1.should_receive(:save).and_return(true)
      ThankYouMailer.should_receive(:success).and_return(@thanks)
      post :create, :message => {}

      response.should be_success
    end

    it "should send failure email and success status if invalid message" do
      ThankYouMailer.should_receive(:failure).and_return(@thanks)

      post :create, :message => {}

      response.should be_success
    end
  end
end
