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

class PendingForm < ActiveRecord::Base
  belongs_to :user
  belongs_to :client, class_name: 'User', foreign_key: :client_id
end
