class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.date :time
      t.timestamps
    end
  end
end
