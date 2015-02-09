class CreateServerInfos < ActiveRecord::Migration
  def change
    create_table :server_infos do |t|
      t.string :server_name
      t.string :app_technology
      t.string :ide
      t.string :scm
      t.string :ci_server
      t.string :configuration_management

      t.timestamps
    end
  end
end
