class CreateVendorRelationships < ActiveRecord::Migration
  def change
    create_table :vendor_relationships do |t|
      t.integer :user_id
      t.integer :vendor_id
      t.text :note

      t.timestamps
    end
  end
end
