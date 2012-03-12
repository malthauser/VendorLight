class VendorsController < ApplicationController
  # GET /vendors
  # GET /vendors.json
  def index
    @vendor = current_user.vendors

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vendors }
    end
  end

  # GET /vendors/1
  # GET /vendors/1.json
  def show
    @vendor = Vendor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vendor }
    end
  end

  # GET /vendors/new
  # GET /vendors/new.json
  def new
    @vendor = current_user.vendors.build
    @vendor_relationship = current_user.vendor_relationships.build
    @vendor_relationship.vendor = @vendor
    @product = @vendor.products.build
    @product_vendor_relationship = @product.product_vendor_relationships.build
    @product_vendor_relationship.vendor_relationship = @vendor_relationship
  end

  # GET /vendors/1/edit
  def edit
    @vendor = Vendor.find(params[:id])
  end

  # POST /vendors
  # POST /vendors.json
  def create
    product_vendor_relationship_params = params[:user][:product].delete :product_vendor_relationship
    product_params = params[:user].delete :product
    vendor_relationship_params = params[:user].delete :vendor_relationship
    user_param = params[:user]

    @vendor = User.find_by_email(user_param[:email]) || current_user.vendors.build(user_param)
    if @vendor.new_record?
      @vendor.password = User.reset_password_token
      @vendor.reset_password_token = User.reset_password_token
      @vendor.reset_password_sent_at = Time.now
      @vendor_relationship = current_user.vendor_relationships.build vendor_relationship_params
      @vendor_relationship.vendor = @vendor 
    elsif current_user.vendors.find_by_id(@vendor.id).present? #means that this vendor relationship already exists
      @vendor_relationship = current_user.vendor_relationships.find_by_vendor_id(@vendor.id)
    else
      @vendor_relationship = current_user.vendor_relationships.build vendor_relationship_params
      @vendor_relationship.vendor = @vendor 
    end
    @product = @vendor.products.build product_params
    @product_vendor_relationship = @product.product_vendor_relationships.build product_vendor_relationship_params
    @product_vendor_relationship.vendor_relationship = @vendor_relationship

    if @vendor.save
      UserMailer.invite(current_user, @vendor).deliver!
      flash[:notice] = "A new vendor has been created and a request has been sent to them to verify the details"
      redirect_to welcome_user_path(current_user)
    else 
      flash[:error] = @vendor.errors.full_messages
      render :action => 'new'
    end
  end

  # PUT /vendors/1
  # PUT /vendors/1.json
  def update
    @vendor = Vendor.find(params[:id])

    respond_to do |format|
      if @vendor.update_attributes(params[:vendor])
        format.html { redirect_to @vendor, notice: 'Vendor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors/1
  # DELETE /vendors/1.json
  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy

    respond_to do |format|
      format.html { redirect_to user_vendors_url(current_user) }
      format.json { head :no_content }
    end
  end

end
