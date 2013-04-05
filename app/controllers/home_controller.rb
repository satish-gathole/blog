class HomeController < ApplicationController
  def index
    if user_signed_in?
    @current_user_posts = Post.from_users_followed_by(current_user).paginate(:page => params[:page])
    else
      @current_user_posts = []
    end

  end
end
