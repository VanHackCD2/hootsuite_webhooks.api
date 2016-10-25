class Api::V1::PostsController < Api::V1::ApiController
  before_action :set_post, only: [:show]

  def index
    @posts = filtering_parameters(params)
  end

  def show
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      Thread.start do
        #sleep(1.minutes)
        

        Curl.post(@post.hook.url, { message: @post.message })

        ActiveRecord::Base.connection.close
      end

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

  def destroy
    if @post.destroy
      render_done("destroy")
    else
      render_errors(@post.errors.full_messages)
    end
  end
=end

private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:message, :hook_id)
  end

  def filtering_parameters(params)
    posts = Post.all.order(updated_at: :desc)

    return posts if params["posts"].nil?

    posts = posts.where(message: params["posts"]["message"]) if !params["posts"]["message"].nil?
    posts = posts.where(hook_id: params["posts"]["hook_id"]) if !params["posts"]["hook_id"].nil?

    posts
  end
end
