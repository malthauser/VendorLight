class InvitationsController < ApplicationController

  def invite
    @vendor = User.find_by_email(params[:email]) || User.new(email: params[:email])
    if @vendor.new_record?
      pass = SecureRandom.hex(8)
      @vendor.password = pass
      @vendor.password_confirmation = pass
      
      if !@vendor.valid?
        if @vendor.errors[:email].present?
          flash[:error] = ["Email #{@vendor.errors[:email].first}"]
        else
          @vendor.pending = true
          @vendor.save! validate: false 
          @vendr.pending_forms.create client_id: current_user.id, relationship_id: @vendor_relationship.id
          @vendor_relationship = VendorRelationship.new user_id: current_user.id, vendor_id: @vendor.id
          if @vendor_relationship.save
            UserMailer.request_and_invite(current_user, @vendor, pass, @vendor_relationship.id).deliver! 
            flash[:notice] = "Request sent to #{params[:email]}"
          else
            flash[:error] = @vendor_relationship.errors
          end
        end
      else
        @vendor.save!
        @vendor_relationship = VendorRelationship.new user_id: current_user.id, vendor_id: @vendor.id
        if @vendor_relationship.save
          UserMailer.request_and_invite(current_user, @vendor, pass, @vendor_relationship.id).deliver! 
          flash[:notice] = "Request sent to #{params[:email]}"
        else
          flash[:error] = @vendor_relationship.errors.full_messages
        end
      end
    else
      @vendor_relationship = VendorRelationship.new(user_id: current_user.id, vendor_id: @vendor.id)
      if @vendor_relationship.save
        UserMailer.request_update(current_user, @vendor, @vendor_relationship).deliver! 
        flash[:notice] = "Request sent to #{params[:email]}"
      else
        flash[:error] = @vendor_relationship.errors.full_messages
      end
    end
    redirect_to welcome_user_path(current_user)
  end
end
