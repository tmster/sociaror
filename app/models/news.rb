class News < ActiveRecord::Base
  attr_accessible :user_id, :content, :status, :summary, :title
  belongs_to :user
  acts_as_commentable
end
