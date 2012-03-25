# == Schema Information
#
# Table name: pending_forms
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  client_id  :integer(4)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'test_helper'

class PendingFormTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
