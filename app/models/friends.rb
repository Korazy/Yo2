class Friends < ActiveRecord::Base
	belongs_to :friend, :foreign_key => :friend_id, class_name: 'User'
  	belongs_to :friendx, :foreign_key => :friendx_id, class_name: 'User'

  	scope :involving, -> (user) do
    	where("friends.friend_id =? OR friends.friendx_id =?",user.id,user.id)
	end

	scope :including, -> (usera, userb) do
    	where("friends.friend_id =? AND friends.friendx_id =?",usera,userb)		
	end

	scope :includingx, -> (usera, userb) do
    	where("friends.friend_id =? AND friends.friendx_id =?",userb,usera)		
	end



  
end
