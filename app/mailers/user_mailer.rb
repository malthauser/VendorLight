class UserMailer < ActionMailer::Base
  default from: "hello@vendorlight.com"

  def invite(user, vendor)
    @user = user
    @vendor = vendor
    mail to: @vendor.email, cc: @user.email, subject: "#{@user.company_name} - Please update your VendorLight account"
  end
end
