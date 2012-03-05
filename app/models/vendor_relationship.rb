# == Schema Information
#
# Table name: vendor_relationships
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  vendor_id  :integer(4)
#  note       :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class VendorRelationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :vendor, class_name: 'User'
  belongs_to :client, class_name: 'User', foreign_key: 'user_id'
  has_many :product_vendor_relationships
end
