class Comment < ActiveRecord::Base
  
  belongs_to :finstagram_post
  belongs_to :user
  
  validates_presence_of :text, :user, :finstagram_post
  
end