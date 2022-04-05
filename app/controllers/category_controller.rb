class CategoryController < ApplicationController
  def show
    @categories = Category.find_by(slug: params[:slug])
  end
end
