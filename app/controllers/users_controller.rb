class UsersController < ApplicationController

  # GET /users/new
  def new
    @vendor = User.new
    @product = @vendor.products.build
    @product_vendor_relationship = @product.product_vendor_relationships.build
    @vendor_relationship = @vendor.vendor_relationships.build
  end

  # POST /users
  def create
    @vendor = User.new params[:user]
    if @vendor.save
      flash[:notice] = "A new vendor has been created and a request has been sent for him to verify the details" 
      redirect_to welcome_user_path(current_user)
    else
      flash.now[:error] = @vendor.errors.full_messages
      render :action => 'new'
    end
  end

  # GET /users/welcome
  def welcome
    @user = User.find(params[:id])
  end
end
