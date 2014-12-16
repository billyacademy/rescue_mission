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
    else
      render new_post_path(@post)
    end
    # elsif @post.title.empty? && @post.description.empty?
    #   flash[:notice] = "Title can't be blank Title is too short (minimum is 40 characters)"
    #   render new_post_path(@post)
    # elsif @post.title.length <= 40
    #   flash[:notice] = "Title is too short (minimum is 40 characters)"
    #   render new_post_path(@post)
    # elsif @post.description.length <= 150
    #   flash[:notice] = "Description is too short (minimum is 150 characters) with atleast 150 characters"
    #   render new_post_path(@post)
    # end
  end

  def show
    @post = Post.find(params[:id])
    #@response = Response.where(params[:post_id])
    @response = Response.new

    @responses = Response.where(post_id: @post[:id])
  end


  private

  def post_params
    params.require(:post).permit(:title, :description)
  end



end
