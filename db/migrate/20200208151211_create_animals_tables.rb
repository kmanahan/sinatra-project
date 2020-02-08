class CreateAnimalsTables < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name 
      t.string :species
      t.string :sex
      t.integer :farmer_id 
      t.timestamps null: false
    end
  end
end
