class PostsController < ApplicationController
  require 'mail'

  def index
    @posts = Post.active_posts.order('created_at DESC')
  end

  def create
    message = Mail.new(params[:message])
    @post = Post.new(:active => true, :message => message)

    if @post.save
      render :nothing => true, :status => 200
    else
      render :text => @post.errors.full_messages, :status => 404
    end
  end
end