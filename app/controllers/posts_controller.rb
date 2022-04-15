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

  def edit
    begin
      @post = current_user.posts.find_by!(slug: params[:slug])
    rescue
      redirect_to root_path
    end
  end

  def update
    begin
      @post = current_user.posts.find_by!(slug: params[:slug])
      @post.category_id = current_user.categories.find(params[:post][:category_id]).id
      @post.user_id = current_user.id
    rescue
      redirect_to root_path
      return
    end
    if @post.update(post_params)
      redirect_to post_path(@post.slug)
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def show
    @post = Post.find_by(slug: params[:slug])
  end

  def destroy
    begin
      @post = current_user.posts.find_by!(slug: params[:slug])
    rescue
      redirect_to root_path
    end
    @post.destroy
    redirect_to root_path, status: :see_other
  end
  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
