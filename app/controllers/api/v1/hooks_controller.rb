class Api::V1::HooksController < Api::V1::ApiController
  before_action :set_hook, only: [:show, :edit, :update, :destroy]

  def index
    @hooks = filtering_parameters(params)
  end

  def show
  end

  def create
    @hook = Hook.new(hook_params)

    if @hook.save
      render :show
    else
      render_errors(@user.errors.full_messages)
    end
  end

  def update
    if @hook.update(hook_params)
      render :show
    else
      render_errors(@user.errors.full_messages)
    end
  end

  def destroy
    if @hook.destroy
      render_done("destroy")
    else
      render_errors(@user.errors.full_messages)
    end
  end

private

  def set_hook
    @hook = Hook.find(params[:id])
  end

  def hook_params
    params.require(:hook).permit(:url)
  end

  def filtering_parameters(params)
    hooks = Hook.all

    return hooks if params["hooks"].nil?

    hooks = hooks.where(url: params["hooks"]["url"]) if !params["hooks"]["url"].nil?

    hooks
  end
end
