class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.hstore :item_attributes
      t.timestamps
    end
  end
end
