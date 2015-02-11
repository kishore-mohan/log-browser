class CreateChefMappings < ActiveRecord::Migration
  def change
    create_table :chef_mappings do |t|
      t.integer :source_id	
      t.string :tool_name
      t.string :cookbook_ref
      t.string :git_url
      t.string :version

      t.timestamps
    end
  end
end
