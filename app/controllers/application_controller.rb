class ApplicationController < ActionController::Base
  protect_from_forgery

  # After sign in redirect to user profile page
  def after_sign_in_path_for(user)
        user_url(user)
  end
end
