class LikesController < ApplicationController

  def create
		@like = Like.all
		@tweet = Tweet.find(params[:tweet_id])
		tweet_likes = tweet.likes.build
		tweet_likes.user = current_user
		tweet_likes.save
	end

	def destroy
		@like = Like.all
		@tweet = Tweet.find(params[:tweet_id])
		like = Like.find(params[:id])
		like.destroy
	end

	private

	def tweet
		Tweet.find(params[:tweet_id])
	end

end
