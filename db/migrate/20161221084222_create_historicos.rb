class CreateHistoricos < ActiveRecord::Migration
  def change
    create_table :historicos do |t|
      t.string :nombrefrutoseco, limit: 40
      t.float :preciofrutoseco

      t.timestamps null: false
    end
  end
end
