class Blog < ActiveRecord::Base
  belongs_to :sender, :foreign_key => :uid, class_name: 'User'
end
