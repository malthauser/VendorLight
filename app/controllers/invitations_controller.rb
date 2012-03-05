class InvitationsController < ApplicationController

  def invite
    vendor = User.find_by_email(params[:email]) || User.new(email: params[:email])
    vendor.save! if vendor.new_record?

    VendorRelationship.create(user_id: current_user.id, vendor_id: vendor.id) # What if already exists ??
    UserMailer.invite(current_user, vendor).deliver!
    
    redirect_to welcome_user_path(current_user), notice: "Request sent to #{params[:email]}"
  end
end
