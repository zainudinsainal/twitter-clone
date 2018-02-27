class TagsController < ApplicationController

  def index
    @tags = Tag.all
    @user = current_user
  end

  def show
    @tag = Tag.find(params[:id])
    @user = current_user
    @tags = Tag.all
    @user_followers = @user.followers.limit(10)
  end

end
