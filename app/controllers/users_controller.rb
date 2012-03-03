class UsersController < ApplicationController

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "#{ @user.email } was successfully created."
      redirect_to users_path
    else
      render :action => 'new'
    end
  end

  # GET /users/welcome
  def welcome
    @user = User.find(params[:id])
  end

end
