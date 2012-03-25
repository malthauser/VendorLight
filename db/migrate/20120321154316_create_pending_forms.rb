class CreatePendingForms < ActiveRecord::Migration
  def change
    create_table :pending_forms do |t|
      t.integer :user_id
      t.integer :client_id

      t.timestamps
    end
  end
end
