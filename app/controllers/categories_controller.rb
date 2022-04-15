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
    rescue
      redirect_to new_user_session_path
      return
    end
    if @category.save
      redirect_to category_path(@category.slug)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    begin
    @category = current_user.categories.find_by!(slug: params[:slug])
    rescue
      redirect_to root_path
    end
  end

  def update
    binding.pry
    begin
    @category = current_user.categories.find_by!(slug: params[:slug])
    rescue
      redirect_to root_path
      return
    end
    if @category.update(category_params)
      redirect_to category_path(@category.slug)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    begin
        @category = current_user.categories.find_by!(slug: params[:slug])
    rescue
      redirect_to root_path
      return
    end
    @category.destroy
    redirect_to root_path, status: :see_other
  end


  private

  def category_params
    params.require(:category).permit(:title)
  end
end
