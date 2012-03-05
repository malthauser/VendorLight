class CreateProductVendorRelationships < ActiveRecord::Migration
  def change
    create_table :product_vendor_relationships do |t|
      t.integer :product_id
      t.integer :vendor_relationship_id
      t.date :billing_date
      t.integer :billing_cycle_quantity
      t.integer :billing_cycle_unit
      t.float :price_paid

      t.timestamps
    end
  end
end
