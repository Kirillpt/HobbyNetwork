class MainpagesController < ApplicationController
  def index
    @users = User.all
    @new_posts = Post.all.order("updated_at DESC")
    @new_category = Category.new
    if current_user.present?
        @user_posts = current_user.posts.order("updated_at DESC").first(10)
    end
  end

  def homepage
    @posts = Post.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    if params[:post_search]
      @post_search_result= Post.search(params[:post_search]).order("created_at DESC")
    elsif params[:category_search]
      @category_search_result = Category.search(params[:category_search]).order("created_at DESC")
    end
  end
end
