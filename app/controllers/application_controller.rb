class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  def after_sign_in_path_for(resource)
    return stored_location_for(resource) || welcome_user_path(current_user)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to welcome_user_path(current_user), :alert => exception.message
  end
end
