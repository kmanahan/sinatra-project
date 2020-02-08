class CreateAnimalsTables < ActiveRecord::Migration
  def change
    create_table :animals_tables do |t|
      t.name :name 
      t.integer :farmer_id 
      t.timestamps null: false
    end
  end
end
