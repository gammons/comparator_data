class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.hstore :attributes

      t.timestamps
    end
  end
end
