class PostsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :can_delete_post, :only => :destroy

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Post created!"
    else
      @feed_items = []
    end
    redirect_to current_user
  end

  def destroy
    @post.destroy
    redirect_to current_user
  end

  private

  def can_delete_post
    @post = current_user.posts.find_by_id(params[:id])
    redirect_to root_path if @post.nil?
  end
end
