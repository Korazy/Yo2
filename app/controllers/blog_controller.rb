class BlogController < ApplicationController
  before_filter :authenticate_user!
  def index
  	@allmessages = Blog.all
  end

  def post
  	text = params[:user_message]
  	b = Blog.new
  	b.uid = current_user.id
  	b.msg = text
  	b.save
  	redirect_to('/blog/index')
  end
end
