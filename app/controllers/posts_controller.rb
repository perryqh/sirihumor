class PostsController < ApplicationController
  require 'mail'

  def index
    @posts = Post.active_posts.order(:created_at)
  end

  def create
    message = Mail.new(params[:message])
    @post = Post.new(:active => false, :screenshot => message.attachments.first)

    if @post.save
      render :nothing => true, :status => 200
    else
      render :nothing => true, :status => 404
    end
  end
end