class PostsController < ApplicationController
  def index
    @posts = Post.active_posts.order(:created_at)
  end

  def create
    render :nothing => true, :status => 200
  end
end