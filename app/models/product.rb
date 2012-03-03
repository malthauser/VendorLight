# == Schema Information
#
# Table name: products
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  cost        :float
#  user_id     :integer(4)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Product < ActiveRecord::Base
  belongs_to :user
  has_many :product_vendor_relationships
  has_many :vendor_relationships, through: :product_vendor_relationships

  validates :cost, numericality: true
  validates :name, presence: true
end
