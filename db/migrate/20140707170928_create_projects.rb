class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.datetime :start
      t.datetime :end
      t.string :name
      t.string :trello_id

      t.timestamps
    end
  end
end
