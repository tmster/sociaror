class Pytanium < ActiveRecord::Base
  attr_accessible :content, :parent_pytania_id, :status, :title, :user_id
    belongs_to :user
  belongs_to :parent, :class_name => "Pytanium", :foreign_key => "parent_pytania_id"

  has_many :replies, :class_name => "Pytanium", :foreign_key => "parent_pytania_id"
  acts_as_votable

  def score
    	return self.likes.size - self.dislikes.size
  end
end
