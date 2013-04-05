class HomeController < ApplicationController
  def index
    if user_signed_in?
      @post = current_user.posts.build
      @posts = Post.from_users_followed_by(current_user).paginate(:page => params[:page])
      @following = current_user.followed_users.paginate(:page => params[:followed_page], :per_page => 5)
      @followers = current_user.followers.paginate(:page => params[:follower_page], :per_page => 5)

      #paginate(:page => params[:page], :per_page => 10)
    else
      @posts = []
    end

  end
end
