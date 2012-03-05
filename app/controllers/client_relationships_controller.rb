class ClientRelationshipsController < ApplicationController
  # GET /client_relationships
  # GET /client_relationships.json
  def index
    @client_relationships = current_user.client_relationships

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @client_relationships }
    end
  end

  # GET /client_relationships/1
  # GET /client_relationships/1.json
  def show
    @client_relationship = VendorRelationship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client_relationship }
    end
  end

  # GET /client_relationships/new
  # GET /client_relationships/new.json
  def new
    @client_relationship = VendorRelationship.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client_relationship }
    end
  end

  # GET /client_relationships/1/edit
  def edit
    @client_relationship = VendorRelationship.find(params[:id])
  end

  # POST /client_relationships
  # POST /client_relationships.json
  def create
    @client_relationship = VendorRelationship.find(params[:client_relationship])

    respond_to do |format|
      if @client_relationship.save
        format.html { redirect_to @client_relationship, notice: 'client relationship was successfully created.' }
        format.json { render json: @client_relationship, status: :created, location: @client_relationship }
      else
        format.html { render action: "new" }
        format.json { render json: @client_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /client_relationships/1
  # PUT /client_relationships/1.json
  def update
    @client_relationship = VendorRelationship.find_by_vendor_id(params[:id])

    respond_to do |format|
      if @client_relationship.update_attributes(params[:client_relationship])
        format.html { redirect_to @client_relationship, notice: 'client relationship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_relationships/1
  # DELETE /client_relationships/1.json
  def destroy
    @client_relationship = VendorRelationship.find_by_vendor_id(params[:id])
    @client_relationship.destroy

    respond_to do |format|
      format.html { redirect_to client_relationships_url }
      format.json { head :no_content }
    end
  end
end
