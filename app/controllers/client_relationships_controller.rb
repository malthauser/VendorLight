class ClientRelationshipsController < ApplicationController
  # GET /client_relationships
  def index
    @client_relationships = current_user.client_relationships

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /client_relationships/1
  def show
    @client_relationship = VendorRelationship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /client_relationships/new
  def new
    @client_relationship = VendorRelationship.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /client_relationships/1/edit
  def edit
    @client_relationship = VendorRelationship.find(params[:id])
    @vendor = current_user
    @product = current_user.products.build
    @product_vendor_relationship = @product.product_vendor_relationships.build
  end

  # POST /client_relationships
  def create
    @client_relationship = VendorRelationship.find(params[:client_relationship_id])
    product_params = params[:user].delete(:product)
    product_vendor_relationship_params = product_params.delete(:product_vendor_relationship)
    vendor_relationship_params = params[:user].delete(:vendor_relationship)
    @client_relationship.update_attributes(vendor_relationship_params)
    @product = current_user.products.build(product_params)
    @product_vendor_relationship = @product.product_vendor_relationships.build(product_vendor_relationship_params)
    @product_vendor_relationship.vendor_relationship = @client_relationship

    respond_to do |format|
      if @product.save
        format.html { redirect_to @client_relationship, notice: 'Thanks for updating the information' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /client_relationships/1
  def update
    @client_relationship = VendorRelationship.find_by_vendor_id(params[:id])

    respond_to do |format|
      if @client_relationship.update_attributes(params[:client_relationship])
        format.html { redirect_to @client_relationship, notice: 'client relationship was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /client_relationships/1
  def destroy
    @client_relationship = VendorRelationship.find_by_vendor_id(params[:id])
    @client_relationship.destroy

    respond_to do |format|
      format.html { redirect_to client_relationships_url }
    end
  end
end
