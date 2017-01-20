class CreateListacorreos < ActiveRecord::Migration
  def change
    create_table :listacorreos do |t|
      t.string :nombre
      t.string :email

      t.timestamps null: false
    end
  end
end
