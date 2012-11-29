class AddDefaultToPosition < ActiveRecord::Migration
  def change
  	change_column_default(:tasks, :position, 0)
  end
end
