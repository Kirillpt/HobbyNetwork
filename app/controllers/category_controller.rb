class CategoryController < ApplicationController
  def show
    @categories = Category.find_by(slug: params[:slug])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.users << current_user
    if @category.save
      redirect_to root_url
    else
      render :new, status: :unprocessable_entity
    end
  end
  private

  def category_params
    params.require(:category).permit(:title)
  end
end
