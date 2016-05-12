class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :index

      t.timestamps null: false
    end
  end
end
