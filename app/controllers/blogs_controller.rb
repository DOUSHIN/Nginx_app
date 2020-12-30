class BlogsController < ApplicationController

  def new
    @blog = Blog.new
  end

  def confirm
    @blog = Blog.new(blog_params)
  end

  def create
    if params[:back]
      @blog = Blog.new(blog_params)
      render :new
    else
      @blog = Blog.new(blog_params)
      if @blog.save
        redirect_to blogs_path
      else
        render :new
      end
    end
  end

  def index
    @blogs = Blog.all
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:notice] = "削除したよ"
    redirect_to blogs_path
  end

  def update
    if params[:back]
      @blog = Blog.new(blog_params)
      render :new
    else
      @blog = Blog.find(params[:id])
      @blog.update(blog_params)
      flash[:notice] = "編集完了"
      redirect_to blogs_path
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:content)
  end

end
