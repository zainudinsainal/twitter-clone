class TweetsController < ApplicationController

  before_action :set_tweet, only:  [:show, :edit, :update, :destroy]

  def index
    @tweet = Tweet.new
    @tweets = Tweet.all
    @user_tweet = current_user.tweets.order("created_at DESC")
    @user = current_user
    @user_following = @user.followings
  end

   def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save

      redirect_to tweets_path
    else

      redirect_to tweets_path
    end
  end

  def show
    @tweet = Tweet.find(params[:id])

    @reply = Reply.new

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
