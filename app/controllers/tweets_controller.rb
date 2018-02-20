class TweetsController < ApplicationController

  before_action :authenticate_user!
  
  before_action :set_tweet, only:  [:show, :edit, :update, :destroy]

  def index
    @tweet = Tweet.new
    @tweets = Tweet.all
    @user_tweet = current_user.tweets
   # @users = @tweet.find #followers tweets
  end

   def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      flash[:notice] = "Tweet was successfully created"
      redirect_to tweets_path
    else
      flash[:alert] = "Tweet was failed to create"
      redirect_to tweets_path
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user

  end

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_path
    flash[:alert] = "restaurant was deleted"
  end

  private

  def tweet_params
    params.require(:tweet).permit(:post)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

end
