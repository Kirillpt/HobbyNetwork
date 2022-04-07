class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(slug: params[:slug])
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
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @Category = Category.find_by(slug: params[:slug])
    @Category.destroy
    redirect_to root_path, status: :see_other
  end


  private

  def category_params
    params.require(:category).permit(:title)
  end
end