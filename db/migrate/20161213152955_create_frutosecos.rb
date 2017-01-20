class CreateFrutosecos < ActiveRecord::Migration
  def change
    create_table :frutosecos do |t|
      t.string :nombrefrutoseco
      t.float :preciofrutoseco

      t.timestamps null: false
    end
  end
end
