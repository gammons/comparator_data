class AddPositionToTodoItem < ActiveRecord::Migration
  def change
    add_column :attributes, :position, :integer
  end
end
