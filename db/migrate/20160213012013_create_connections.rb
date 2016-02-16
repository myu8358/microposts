class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.references :favorite, index: true
      t.references :favored, index: true

      t.timestamps null: false
      
      t.index [:favorite_id, :favored_id], unique: true 
    end
  end
end
