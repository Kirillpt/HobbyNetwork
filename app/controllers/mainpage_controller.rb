class MainpageController < ApplicationController
  def index
    @users = User.all
  end
end
