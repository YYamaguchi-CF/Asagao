class PostIllustsController < ApplicationController
  before_action :login_required, except: [:index, :show]

  def index
    if params[:member_id]
      @member = Member.find(params[:member_id])
      @post_illusts = @member.post_illusts
    else
      @post_illusts = PostIllust.all
    end

    @post_illusts = @post_illusts.order(posted_at: :desc).page(params[:page]).per(3)
  end

  def show
    @post_illust = PostIllust.find(params[:id])
  end

  def new
    @post_illust = PostIllust.new(posted_at: Time.current)
  end

  def edit
    @post_illust = current_member.post_illusts.find(params[:id])
  end

  def create
    @post_illust = PostIllust.new(post_illust_params)
    @post_illust.poster = current_member
    if @post_illust.save
      redirect_to @post_illust, notice: "イラストを投稿しました。"
    else
      render "new"
    end
  end

  def update
    @post_illust = current_member.post_illusts.find(params[:id])
    @post_illust.assign_attributes(post_illust_params)
    if @post_illust.save
      redirect_to @post_illust, notice: "イラスト投稿を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @post_illust = current_member.post_illusts.find(params[:id])
    @post_illust.destroy
    redirect_to :post_illusts, notice: "記事を削除しました。"
  end

  private
  def post_illust_params
    params.require(:post_illust).permit(
      :title,
      :body,
      :posted_at
    )
  end
end
