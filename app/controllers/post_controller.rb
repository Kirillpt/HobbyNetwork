class PostController < ApplicationController
  def show
    @post = Post.find_by(slug: params[:slug])
  end
end
