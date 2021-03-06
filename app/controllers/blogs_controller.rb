class BlogsController < ApplicationController
  before_action :set_blogs, only: %i[edit update destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "ブログを登録したよ"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集したよ"
    else
      render :edit
    end
  end

  def destroy
    if @blog.destroy
      redirect_to blogs_path, notice: "ブログを削除しました"
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blogs
    @blog = Blog.find(params[:id])
  end
end
