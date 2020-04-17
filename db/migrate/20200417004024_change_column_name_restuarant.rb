class ChangeColumnNameRestuarant < ActiveRecord::Migration[5.2]
  def change
    rename_column :votes, :restuarantID, :restaurantID
  end
end
