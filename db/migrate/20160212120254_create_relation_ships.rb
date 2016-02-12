class CreateRelationShips < ActiveRecord::Migration
  def change
    create_table :relation_ships do |t|
      t.references :favor, index: true
      t.references :favored, index: true

      t.timestamps null: false
      
      t.index [:favor_id, :favored_id], unique: true # この行を追加

    end
  end
end
