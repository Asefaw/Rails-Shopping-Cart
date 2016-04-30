class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :product, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.date :orderDate
      t.integer :totalCharge

      t.timestamps null: false
    end
  end
end
