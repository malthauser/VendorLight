class ProductVendorRelationshipsController < ApplicationController
  # GET /product_vendor_relationships
  # GET /product_vendor_relationships.json
  def index
    @vendor_relationship = VendorRelationship.find params[:vendor_relationship_id]
    @product_vendor_relationships = @vendor_relationship.product_vendor_relationships

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_vendor_relationships }
    end
  end

  # GET /product_vendor_relationships/1
  # GET /product_vendor_relationships/1.json
  def show
    @vendor_relationship = VendorRelationship.find params[:vendor_relationship_id]
    @product_vendor_relationship = @vendor_relationship.product_vendor_relationships.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_vendor_relationship }
    end
  end

  # GET /product_vendor_relationships/new
  # GET /product_vendor_relationships/new.json
  def new
    @vendor_relationship = VendorRelationship.find params[:vendor_relationship_id]
    @product_vendor_relationship = @vendor_relationship.product_vendor_relationships.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_vendor_relationship }
    end
  end

  # GET /product_vendor_relationships/1/edit
  def edit
    @vendor_relationship = VendorRelationship.find params[:vendor_relationship_id]
    @product_vendor_relationship = @vendor_relationship.product_vendor_relationships.find params[:id]
    @vendor = @vendor_relationship.vendor
    binding.pry
  end

  # POST /product_vendor_relationships
  # POST /product_vendor_relationships.json
  def create
    @vendor_relationship = VendorRelationship.find params[:vendor_relationship_id]
    @product_vendor_relationship = @vendor_relationship.product_vendor_relationships.build(params[:product_vendor_relationship])

    respond_to do |format|
      if @product_vendor_relationship.save
        format.html { redirect_to @vendor_relationship, @product_vendor_relationship, notice: 'Product vendor relationship was successfully created.' }
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
    @product = Product.find params[:product_vendor_relationship].delete(:product)['id']
    @vendor_relationship = VendorRelationship.find params[:vendor_relationship_id]
    @product_vendor_relationship = @vendor_relationship.product_vendor_relationships.find params[:id]
    @product_vendor_relationship.product = @product

    respond_to do |format|
      if @product_vendor_relationship.update_attributes(params[:product_vendor_relationship])
        format.html { redirect_to [@vendor_relationship, @product_vendor_relationship], notice: 'Product vendor relationship was successfully updated.' }
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
    @vendor_relationship = VendorRelationship.find params[:vendor_relationship_id]
    @product_vendor_relationship = @vendor_relationship.product_vendor_relationships.find params[:id]
    if @product_vendor_relationship.destroy
      flash[:alert] = 'Vendor relationship successfully destroyed'
    else
      flash[:error] = 'There was an error destroying the relationship'
    end

    respond_to do |format|
      format.html { redirect_to vendor_relationships_path }
      format.json { head :no_content }
    end
  end
end
