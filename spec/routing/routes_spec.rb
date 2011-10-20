require 'spec_helper'

describe 'Routes' do
  context "users" do
    it "should route to index" do
      {:get => '/'}.should route_to('posts#index')
      {:get => '/posts'}.should route_to('posts#index')
    end
  end
end
