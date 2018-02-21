class Admin::TweetsController < Admin::BaseController

  before_action :set_tweet, only:  [:destroy]

  def index
    @tweets = Tweet.all
  end

  def destroy
    @tweet.destroy
    flash[:alert] = "Tweet was deleted"
    redirect_to admin_tweets_path
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

end
