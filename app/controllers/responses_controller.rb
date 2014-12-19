class ResponsesController < ApplicationController

  def new
  end

  def create
    @post = Post.find(params[:post_id])
    @response = Response.new(response_params)
    @response.post_id = params[:post_id]
    @responses = Response.where(post_id: @post[:id])

    if @response.save
      redirect_to @post, notice: "You have successfully submitted a response."
    else
      redirect_to post_path(@post), notice: "Message is too short (minimum is 50 characters)"
    end
  end

  def show
      @post = Post.find(params[:post_id])
      @responses = Response.where(post_id: @post[:id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @response = @post.responses.find(params[:id])
    @response.destroy
    redirect_to post_path(@post)
  end

  private

  def response_params
    params.require(:response).permit(:message)
  end

end


#@all_posts = Post.all.order('created_at DESC')
