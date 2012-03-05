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
#  price_paid             :float
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#

class ProductVendorRelationship < ActiveRecord::Base
  belongs_to :product
  belongs_to :vendor_relationship

  validates :billing_cycle_quantity, numericality: { :only_integer => true }

  cattr_reader :BILLING_CYCLE_UNIT
  @@BILLING_CYCLE_UNIT = { days: 1, weeks: 2, months: 3, years: 4 }
  @@BILLING_CYCLE_UNIT.freeze

  @@BILLING_CYCLE_UNIT.each_key do |unit|
    define_method (unit.to_s + '?').to_sym do
      self.read_attribute(:billing_cycle_unit) == @@BILLING_CYCLE_UNIT[unit]
    end
  end

  def billing_cycle_unit_label
    unit = read_attribute(:billing_cycle_unit)
    @@BILLING_CYCLE_UNIT.each_pair do |key, val|
      if val == unit
        return key.to_s
      end
    end
    return nil
  end

end
