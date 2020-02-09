class AnimalsController < ApplicationController 
  #get new
  def "/animals/new" do 
    erb :"/animals/new"
  end 
  #post new 
  @animal = Animal.create(params[])
  #find by name 
  #find by species 
  #index of all  
end 