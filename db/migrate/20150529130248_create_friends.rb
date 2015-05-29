class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
    	t.integer :friend_id
      	t.integer :friendx_id	
    end

    add_index :friends, :friend_id
    add_index :friends, :friendx_id
  end
end
