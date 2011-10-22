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
  end
end
