class Wykop < ActiveRecord::Base
  attr_accessible :status, :summary, :title, :url, :user_id
    belongs_to :user
  acts_as_commentable
end
