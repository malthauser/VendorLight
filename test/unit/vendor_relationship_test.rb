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

require 'test_helper'

class VendorRelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
