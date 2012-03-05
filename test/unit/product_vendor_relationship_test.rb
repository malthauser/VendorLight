# == Schema Information
#
# Table name: product_vendor_relationships
#
#  id                     :integer(4)      not null, primary key
#  product_id             :integer(4)
#  vendor_relationship_id :integer(4)
#  billing_date           :date
#  billing_cycle_quantity :integer(4)
#  billing_cycle_unit     :integer(4)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#

require 'test_helper'

class ProductVendorRelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
