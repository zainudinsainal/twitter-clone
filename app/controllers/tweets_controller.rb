class TweetsController < ApplicationController

  before_action :set_tweet, only:  [:show]

  def index
    @tweet = Tweet.new
    @tweets = Tweet.all
    @user_tweet = current_user.tweets.order("created_at DESC")
    @user = current_user
    @user_following = @user.followings
    @user_followers = @user.followers.limit(10)
    @tags = Tag.all
  end

   def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      @tag_array = @tweet.post.scan(/#\w+\b/)
      unless @tag_array == []
        @tag_array.each do |tag|
          @tag = Tag.find_or_create_by(content: tag)
          @tag.save
          @tweet.tags << @tag
        end
      end
      redirect_to tweets_path
    else
      redirect_to tweets_path
    end
    end

  def show
    @reply = Reply.new
  end

  private

  def tweet_params
    params.require(:tweet).permit(:post)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

end
