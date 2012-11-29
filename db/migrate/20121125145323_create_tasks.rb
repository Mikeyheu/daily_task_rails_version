class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :position
      t.string :content
      t.boolean :complete
      t.integer :list_id

      t.timestamps
    end
  end
end
