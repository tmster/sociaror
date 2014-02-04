class Wykop < ActiveRecord::Base
  attr_accessible :status, :summary, :title, :url, :user_id
end
