class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user


  validates :comment_title, :presence => true
  validates :comment_body, :presence => true
end
