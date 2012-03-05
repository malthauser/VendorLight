class VendorRelationshipsController < ApplicationController
  # GET /vendor_relationships
  # GET /vendor_relationships.json
  def index
    @vendor_relationships = VendorRelationship.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vendor_relationships }
    end
  end

  # GET /vendor_relationships/1
  # GET /vendor_relationships/1.json
  def show
    @vendor_relationship = VendorRelationship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vendor_relationship }
    end
  end

  # GET /vendor_relationships/new
  # GET /vendor_relationships/new.json
  def new
    @vendor_relationship = VendorRelationship.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vendor_relationship }
    end
  end

  # GET /vendor_relationships/1/edit
  def edit
    @vendor_relationship = VendorRelationship.find(params[:id])
  end

  # POST /vendor_relationships
  # POST /vendor_relationships.json
  def create
    @vendor_relationship = VendorRelationship.new(params[:vendor_relationship])

    respond_to do |format|
      if @vendor_relationship.save
        format.html { redirect_to @vendor_relationship, notice: 'Vendor relationship was successfully created.' }
        format.json { render json: @vendor_relationship, status: :created, location: @vendor_relationship }
      else
        format.html { render action: "new" }
        format.json { render json: @vendor_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vendor_relationships/1
  # PUT /vendor_relationships/1.json
  def update
    @vendor_relationship = VendorRelationship.find(params[:id])

    respond_to do |format|
      if @vendor_relationship.update_attributes(params[:vendor_relationship])
        format.html { redirect_to @vendor_relationship, notice: 'Vendor relationship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vendor_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendor_relationships/1
  # DELETE /vendor_relationships/1.json
  def destroy
    @vendor_relationship = VendorRelationship.find(params[:id])
    @vendor_relationship.destroy

    respond_to do |format|
      format.html { redirect_to vendor_relationships_url }
      format.json { head :no_content }
    end
  end
end
