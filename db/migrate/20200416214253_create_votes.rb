class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :userID
      t.integer :restuarantID
      t.string :voteCast

      t.timestamps
    end
  end
end
