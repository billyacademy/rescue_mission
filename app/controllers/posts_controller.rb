class PostsController < ApplicationController

  def index
    @all_posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post), notice: "You have successfully submitted a post."
    elsif @post.title.empty? && @post.description.empty?
      flash[:notice] = "you must provide a title and description"
      render new_post_path(@post)
    elsif @post.title.length <= 40
      flash[:notice] = "you must provide a title with atleast 40 characters"
      render new_post_path(@post)
    elsif @post.description.length <= 150
      flash[:notice] = "you must provide a description with atleast 150 characters"
      render new_post_path(@post)
    end
  end

  def show
    @post = Post.find(params[:id])
  end


private

def post_params
  params.require(:post).permit(:title, :description)
end

end
