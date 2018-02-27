class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find_by(name: '#' + params[:hashtagurl])
    @posts = @tag.posts.all.order("created_at_DESC")
  end

  private

  def tag_params
    params.require(:tag).permit(:content)
  end

end
