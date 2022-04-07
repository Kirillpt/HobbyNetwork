class MainpagesController < ApplicationController
  def index
    @users = User.all
    @new_posts = Post.last(5)
    @new_category = Category.new
    if current_user.present?
        @user_posts = current_user.posts
    end
  end
end
