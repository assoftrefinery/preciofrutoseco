class ChangeColumn < ActiveRecord::Migration
  def change
      change_column :frutosecos, :nombrefrutoseco, :string, :limit => 40
  end
end
