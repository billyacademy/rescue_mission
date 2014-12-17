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

  end

  def destroy
      @post = Post.find(params[:id])
      @post.destroy

      redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end

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
