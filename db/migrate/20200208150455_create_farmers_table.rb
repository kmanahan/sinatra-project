class CreateFarmersTable < ActiveRecord::Migration
  def change
    create_table :farmers |t| do 
      t.string :name 
      t.string :farm_name 
      t.string :username 
      t.string :password_digest #keeps encrypted password 
    end
  end
end
