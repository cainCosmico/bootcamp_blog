class UserController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def follow
    @user = User.find(params[:id])
    current_user.followees << @user
    redirect_to root_path
  end
  
  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_to root_path
  end

  def followers
    @followers = current_user.followers
  end

  def following
    @following = current_user.followees
  end
end
