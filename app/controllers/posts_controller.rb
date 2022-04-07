class PostsController < ApplicationController
  def show
    @post = Post.find_by(slug: params[:slug])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    category_id = params[:current_user][:category_id]
    begin
    @post.category_id = Category.find(category_id).id
    @post.user_id = current_user.id
    rescue
      render :new
      return
    end

    if @post.save
      redirect_to post_path(@post.slug)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find_by(slug: params[:slug])
  end
  private

  def post_params
    params.require(:post).permit(:title, :body, :current_user => :category_id)
  end
end
