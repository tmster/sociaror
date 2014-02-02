class AdminController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end
  private
     def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
