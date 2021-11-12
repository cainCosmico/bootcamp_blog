class UserController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def follow
    @user = User.find(params[:id])
    current_user.followeds << @user
    redirect_back(fallback_location: root_path)
  end
  
  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(followed_id: @user.id).destroy
    redirect_back(fallback_location: root_path)
  end

  def followers
    @followers = current_user.followers
  end

  def following
    @followeds = current_user.followeds
  end
end
