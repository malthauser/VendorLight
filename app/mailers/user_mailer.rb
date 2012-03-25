class UserMailer < ActionMailer::Base
  default from: "hello@vendorlight.com"

  def request_and_invite(user, vendor, password, relationship_id)
    @user = user
    @vendor = vendor
    @password = password
    @relationship_id = relationship_id
    mail to: @vendor.email, subject: "#{@user.company_name} - Please update your VendorLight account"
  end

  def request_update(user, vendor, relationship)
    @user = user
    @vendor = vendor
    @relationship = relationship
    mail to: @vendor.email, subject: "#{@user.full_name || @user.company_name.to_s} - Please update your VendorLight account"
  end

  def notify(user, vendor, relationship)
    @user = user
    @vendor = vendor
    @relationship = relationship
    mail to: @vendor.email, subject: "#{@user.full_name || @user.company_name.to_s} - Your information has been added to Vendorlight"
  end
end
