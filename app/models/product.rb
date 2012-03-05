# == Schema Information
#
# Table name: products
#
#  id           :integer(4)      not null, primary key
#  name         :string(255)
#  description  :text
#  retail_price :float
#  user_id      :integer(4)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Product < ActiveRecord::Base
  belongs_to :user
  has_many :product_vendor_relationships, dependent: :destroy
  has_many :vendor_relationships, through: :product_vendor_relationships

  accepts_nested_attributes_for :product_vendor_relationships

  validates :retail_price, numericality: true
  validates :name, presence: true
end
