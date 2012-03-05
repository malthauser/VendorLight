class UsersController < ApplicationController
  load_and_authorize_resource

  # GET /users/welcome
  def welcome
    @user = User.find(params[:id])
  end

  def my_account
  end
end
