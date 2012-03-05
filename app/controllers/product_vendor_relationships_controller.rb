class ProductVendorRelationshipsController < ApplicationController
  # GET /product_vendor_relationships
  # GET /product_vendor_relationships.json
  def index
    @product_vendor_relationships = ProductVendorRelationship.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_vendor_relationships }
    end
  end

  # GET /product_vendor_relationships/1
  # GET /product_vendor_relationships/1.json
  def show
    @product_vendor_relationship = ProductVendorRelationship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_vendor_relationship }
    end
  end

  # GET /product_vendor_relationships/new
  # GET /product_vendor_relationships/new.json
  def new
    @product_vendor_relationship = ProductVendorRelationship.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_vendor_relationship }
    end
  end

  # GET /product_vendor_relationships/1/edit
  def edit
    @product_vendor_relationship = ProductVendorRelationship.find(params[:id])
  end

  # POST /product_vendor_relationships
  # POST /product_vendor_relationships.json
  def create
    @product_vendor_relationship = ProductVendorRelationship.new(params[:product_vendor_relationship])

    respond_to do |format|
      if @product_vendor_relationship.save
        format.html { redirect_to @product_vendor_relationship, notice: 'Product vendor relationship was successfully created.' }
        format.json { render json: @product_vendor_relationship, status: :created, location: @product_vendor_relationship }
      else
        format.html { render action: "new" }
        format.json { render json: @product_vendor_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_vendor_relationships/1
  # PUT /product_vendor_relationships/1.json
  def update
    @product_vendor_relationship = ProductVendorRelationship.find(params[:id])

    respond_to do |format|
      if @product_vendor_relationship.update_attributes(params[:product_vendor_relationship])
        format.html { redirect_to @product_vendor_relationship, notice: 'Product vendor relationship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_vendor_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_vendor_relationships/1
  # DELETE /product_vendor_relationships/1.json
  def destroy
    @product_vendor_relationship = ProductVendorRelationship.find(params[:id])
    @product_vendor_relationship.destroy

    respond_to do |format|
      format.html { redirect_to product_vendor_relationships_url }
      format.json { head :no_content }
    end
  end
end
