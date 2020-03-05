class Farmer < ActiveRecord::Base 
  has_secure_password
  has_many :animals
  validates :username, uniqueness: true 
  validates :name, presence: true
end 