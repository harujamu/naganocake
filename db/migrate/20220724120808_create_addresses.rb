class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :customer_id, null: false
      t.string :name, null: false
      t.string :postal_code, null: false
      t.integer :address, null: false, default:0
      t.timestamps
    end
  end
end
