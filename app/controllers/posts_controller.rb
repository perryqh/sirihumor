class PostsController < ApplicationController
  require 'mail'
  respond_to :html

  def index
    @posts = Post.active_posts.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  # called by cloudmailin
  def create
    if params[:message]
      create_from_email
    else
      create_from_form
    end
  end

  private
  def create_from_email
    message = Mail.new(params[:message])
    @post = Post.new(:active => true, :message => message)

    if @post.save
      ThankYouMailer.success(@post.from_email).deliver
    else
      ThankYouMailer.failure(@post.from_email, @post.errors.full_messages.join('. ') << '.').deliver
    end

    render :nothing => true, :status => 200
  end

  def create_from_form
    @post = Post.new(params[:post])
    @post.save
    respond_with @post
  end
end
