class AddSelectedToHeader < ActiveRecord::Migration
  def change
    add_column :attributes, :selected, :boolean, :default => false
  end
end
