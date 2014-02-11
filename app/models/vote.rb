class Vote < ActiveRecord::Base
  attr_accessible :user_id, :vote, :voted_id, :voted_type

  belongs_to :user

  def find_votes_by_user(user)
    where(["user_id = ?", user.id]).order("created_at DESC")
  end

  def voted?(user)
	self.detect {|v| v.user_id == user.id }
  end

  def score
	return 0 if self.empty?
( self.inject(0){|total, v| total += rate.vote }.to_f  )
  end
  
end
