class UsersController < ApplicationController

  before_action :set_user, only:  [:show, :edit, :update]

  def index
    @users = User.all
    @user = current_user
    @user_following = @user.followings
    @user_followers = @user.followers.limit(10)
  end

  def show
    @user_tweet = @user.tweets
    @user_following = @user.followings
    @user_followers = @user.followers.limit(10)
  end

  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User profile was successfully updated"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "User profile was failed to update"
      render :edit
    end
  end

  def followings
    @user  = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :bio, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
