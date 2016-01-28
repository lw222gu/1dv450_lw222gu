class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name, :null => false, :limit => 50
      t.string :description, :limit => 250
      t.string :url
      t.string :key
      t.timestamps null: false
    end
  end
end
