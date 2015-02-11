class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :source_type
      t.string :name
      t.string :ui_view

      t.timestamps
    end
  end
end
