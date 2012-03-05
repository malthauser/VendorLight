class UsersController < ApplicationController

  # GET /users/welcome
  def welcome
    @user = User.find(params[:id])
  end

  def my_account
  end
end
