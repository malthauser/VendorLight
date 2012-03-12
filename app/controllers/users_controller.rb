class UsersController < ApplicationController

  # GET /users/welcome
  def welcome
    @user = current_user
  end

  def user_request
    @user = current_user
  end

  def my_account
  end
end
