class CategoryController < ApplicationController
  def show
    @categories = Category.find_by(slug: params[:slug])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    begin
        @category.users << current_user
    rescue ActiveRecord::AssociationTypeMismatch
      redirect_to new_user_session_path
      return
    end
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
