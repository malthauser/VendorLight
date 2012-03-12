class InvitationsController < ApplicationController

  def invite
    @vendor = User.find_by_email(params[:email]) || User.new(email: params[:email])
    if !@vendor.valid?
      if @vendor.errors[:email].present?
        flash[:error] = ["Email #{@vendor.errors[:email].first}"]
      else
        @vendor.save!(validate: false)
        @vendor_relationship = VendorRelationship.new(user_id: current_user.id, vendor_id: @vendor.id)
        if @vendor_relationship.save
          UserMailer.invite(current_user, @vendor).deliver! 
          flash[:notice] = "Request sent to #{params[:email]}"
        else
          flash[:error] = @vendor_relationship.errors
        end
      end
    else
      @vendor_relationship = VendorRelationship.new(user_id: current_user.id, vendor_id: @vendor.id)
      if @vendor_relationship.save
        UserMailer.invite(current_user, @vendor).deliver! 
        flash[:notice] = "Request sent to #{params[:email]}"
      else
        flash[:error] = @vendor_relationship.errors.full_messages
      end
    end
    redirect_to welcome_user_path(current_user)
  end
end
