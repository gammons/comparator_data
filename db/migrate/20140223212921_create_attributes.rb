class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.string :name
      t.string :key
      t.string :compare
      t.string :format
      t.boolean :sortable

      t.timestamps
    end
  end
end
