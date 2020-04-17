class DeleteColumnsFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :willSplit
    remove_column :restaurants, :wontSplit
  end
end
