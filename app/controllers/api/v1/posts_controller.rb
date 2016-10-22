class Api::V1::PostsController < Api::V1::ApiController
  before_action :set_post, only: [:show, :edit, :destroy]

  def index
    @posts = filtering_parameters(params)
  end

  def show
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render :show
    else
      render_errors(@post.errors.full_messages)
    end
  end

=begin
  def update
    if @post.update(post_params)
      render :show
    else
      render_errors(@post.errors.full_messages)
    end
  end
=end

  def destroy
    if @post.destroy
      render_done("destroy")
    else
      render_errors(@post.errors.full_messages)
    end
  end

private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:message, :hook_id)
  end

  def filtering_parameters(params)
    posts = Post.all

    return posts if params["posts"].nil?

    posts = posts.where(message: params["posts"]["message"]) if !params["posts"]["message"].nil?
    posts = posts.where(hook_id: params["posts"]["hook_id"]) if !params["posts"]["hook_id"].nil?

    posts
  end
end
