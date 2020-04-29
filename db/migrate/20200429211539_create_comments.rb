class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :userID
      t.integer :restaurantID
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
