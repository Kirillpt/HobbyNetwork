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
    @posts = Post.all.order("created_at DESC").limit(2)
  end

end
