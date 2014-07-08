class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :trello_id
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
