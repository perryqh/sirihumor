require 'spec_helper'

describe 'Routes' do
  context "posts" do
    it "should route to index" do
      {:get => '/'}.should route_to('posts#index')
      {:get => '/posts'}.should route_to('posts#index')
    end

    it "should route to create" do
      {:post => '/posts'}.should route_to('posts#create')
    end

    it "should route to new" do 
      {:get => '/posts/new'}.should route_to('posts#new')
    end

    it "should route to show" do 
      {:get => '/posts/1'}.should route_to({:action => "show", :controller => "posts", :id => "1"})
    end
  end
end
