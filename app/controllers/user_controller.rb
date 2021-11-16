class UserController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def follow
    current_user.followeds.create(follower_id: current_user.id, followed_id: params[:id])
    redirect_back(fallback_location: root_path)
  end
  
  def unfollow
    current_user.followeds.find_by(followed_id: params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  def followers
    @followers = current_user.followers
  end

  def following
    @followeds = current_user.followeds
  end
end
