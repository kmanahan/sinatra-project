class CreateFarmersTable < ActiveRecord::Migration
  def change
    create_table :farmers do |t| 
      t.string :name 
      t.string :farm_name 
      t.string :username 
      t.string :password_digest #keeps encrypted password 
      t.timestamps null: false
    end
  end
end
