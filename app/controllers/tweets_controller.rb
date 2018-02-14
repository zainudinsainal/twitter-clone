class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
    @users = User.all
  end

  def new 
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def show 
    @tweet = Tweet.find(params[:id])
    @user = User.find(params[:id])
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:tweet)
  end

end
