class PostImagesController < ApplicationController
  before_action :login_required

  before_action do
    @post_illust = current_member.post_illusts.find(params[:post_illust_id])
  end

  def index
    @pimages = @post_illust.pimages.order(posted_at: :desc)
  end

  def show
    @pimage = @post_illust.pimages.find(params[:id])
  end

  def new
    @pimage = @post_illust.pimages.build
  end

  def edit
    @pimage = @post_illust.pimages.find(params[:id])
  end

  def create
    @pimage = @post_illust.pimages.build(pimage_params)
    if @pimage.save
      redirect_to [@post_illust, :pimages], notice: "イラストを作成しました。"
    else
      render "new"
    end
  end

  def update
    @pimage = @post_illust.pimages.find(params[:id])
    @pimage.assign_attributes(pimage_params)
    if @pimage.save
      redirect_to [@post_illust, :pimages], notice: "イラストを更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @pimage = @post_illust.pimages.find(params[:id])
    @pimage.destroy
    redirect_to [@post_illust, :pimages], notice: "イラストを削除しました。"
  end

  private
  def pimages_params
    params.require(:pimage).permit(
      :new_data,
      :alt_text
    )
  end
end
