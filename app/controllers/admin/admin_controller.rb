class Admin::AdminController < AdminController
  layout "admin"
  before_filter :admin_user
  def index
  	@users = User.last(3)
  end
end