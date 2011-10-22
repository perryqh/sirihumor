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
      post :create

      response.should be_success
    end
  end
end