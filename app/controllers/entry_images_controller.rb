class EntryImagesController < ApplicationController
  before_action :login_required, except: [:index, :show]

  before_action do
    @entry = current_member.entries.find(params[:entry_id])
  end

  def index
    @images = @entry.images.order(:position)
  end

  def show
    redirect_to action: "edit"
  end

  def new
    @image = @entry.images.build
  end

  def edit
    @image = @entry.images.find(params[:id])
  end

  def create
    @image = @entry.images.build(image_params)
    if @image.save
      redirect_to [@entry, :images], notice: "画像を作成しました。"
    else
      render "new"
    end
  end

  def update
    @image = @entry.images.find(params[:id])
    @image.assign_attributes(image_params)
    if @image.save
      redirect_to [@entry, :images], notice: "画像を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @image = @entry.images.find(params[:id])
    @image.destroy
    redirect_to [@entry, :images], notice: "画像を削除しました。"
  end

    # 表示位置を上げる
    def move_higher
      @image = @entry.images.find(params[:id])
      @image.move_higher
      redirect_back fallback_location: [@entry, :images]
    end
  
    # 表示位置を下げる
    def move_lower
      @image = @entry.images.find(params[:id])
      @image.move_lower
      redirect_back fallback_location: [@entry, :images]
    end

  # ストロング・パラメータ
    private
    def image_params
      params.require(:image).permit(
        :new_data,
        :alt_text
      )
    end
end
