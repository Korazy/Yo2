class FriendsController < ApplicationController
  
	before_filter :authenticate_user!

	def index
    @friends = Friends.involving(current_user)
    @users = User.where.not("id = ?",current_user.id).order("created_at DESC")
    @conversations = Conversation.involving(current_user).order("created_at DESC")
  end

  def addfriend
  	f=Friends.new
  	f.friend_id=params[:cid]
  	f.friendx_id=params[:uid]
  	f.save
  	redirect_to('/friends/index')
  end

  def deletefriend
  	Friends.where(:friend_id => params[:uid], :friendx_id => params[:cid]).delete_all
  	Friends.where(:friend_id => params[:cid], :friendx_id => params[:uid]).destroy_all
  	redirect_to('/friends/index')
  end

  def search
    @results = User.where(:name => params[:user_search_name])
  end

  def destroy
  end
end
