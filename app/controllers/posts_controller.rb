class PostsController < ApplicationController
  def index
    @posts = Post.active_posts.order(:created_at)
  end
end