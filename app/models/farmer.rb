class Farmer < ActiveRecord::Base 
  has_secure_password #uses bcrypt to make sure password is correct
  has_many :animals
  validates :username, uniqueness: true 
  validates :name, presence: true
end 