class ResponsesController < ApplicationController

  def new
  end

  def create
    @post = Post.find(params[:post_id])
    @response = Response.new(response_params)
    @response.post_id = params[:post_id]

    #@response.post_id = @post
    @response.save!
    redirect_to @post

    # if @response.save
    #   redirect_to

  #   if @post.save
  #     redirect_to post_path(@post), notice: "You have successfully submitted a post."
  #   elsif @post.title.empty? && @post.description.empty?
  #     flash[:notice] = "Title can't be blank Title is too short (minimum is 40 characters)"
  #     render new_post_path(@post)
  #   elsif @post.title.length <= 40
  #     flash[:notice] = "Title is too short (minimum is 40 characters)"
  #     render new_post_path(@post)
  #   elsif @post.description.length <= 150
  #     flash[:notice] = "Description is too short (minimum is 150 characters) with atleast 150 characters"
  #     render new_post_path(@post)
  #   end
  # end


  end
  private

  def response_params
    params.require(:response).permit(:message)
  end

end
