class User < ActiveRecord::Base 
  has_secure_password #uses bcrypt to make sure password is correct
end 