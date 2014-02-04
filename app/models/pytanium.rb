class Pytanium < ActiveRecord::Base
  attr_accessible :content, :parent_pytania_id, :status, :title, :user_id
end
