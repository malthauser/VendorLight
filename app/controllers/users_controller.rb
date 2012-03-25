class UsersController < ApplicationController
  load_and_authorize_resource

  # GET /users/welcome
  def welcome
    @user = current_user
  end

  def user_request
    @user = current_user
  end

  def my_account
  end

  def edit
    redirect_to edit_user_registration_path(current_user, relationship_id: params[:relationship_id])
  end

end
