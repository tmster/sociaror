class Pytanium < ActiveRecord::Base
  attr_accessible :content, :parent_pytania_idtitle, :status, :user_id
end
