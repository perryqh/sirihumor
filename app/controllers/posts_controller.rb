class PostsController < ApplicationController
  require 'mail'

  def index
    @posts = Post.active_posts.order('created_at DESC')
  end

  # called by cloudmailin
  def create
    message = Mail.new(params[:message])
    @post = Post.new(:active => true, :message => message)

    if @post.save
      ThankYouMailer.success(@post.from_email).deliver
      render :nothing => true, :status => 200
    else
      ThankYouMailer.failure(@post.from_email, @post.errors.full_messages.join('. ') << '.').deliver
      render :text => @post.errors.full_messages, :status => 404
    end
  end
end