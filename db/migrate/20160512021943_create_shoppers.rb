class CreateShoppers < ActiveRecord::Migration
  def change
    create_table :shoppers do |t|
      t.string :name
      t.string :username
      t.has_one :cart

      t.timestamps null: false
    end
  end
end
