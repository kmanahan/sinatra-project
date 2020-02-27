class Animal < ActiveRecord::Base
  belongs_to :farmer
  validates :name, presence: true 
  validates :species, presence: true
  validates :sex, presence: true
end
