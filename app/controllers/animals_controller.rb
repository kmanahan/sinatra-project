class AnimalsController < ApplicationController 
  #get new
  get "/animals/new" do 
    erb :"/animals/new"
  end 
  #post new 
  post "/animals" do 
    if logged_in? 
      redirect "/"
    end 
    if params[:animal] != ""
    @animal = Animal.create(name: params[:name], species: params[:species], gender: params[:sex], farmer_id: current_user.id)
      redirect "/animals/#{@animal.id}"
    else
      redirect "/animals/new"
    end 
  end

  get "/animals/:id" do
  #find by id, dynamic route => look for better definition 
    @animal = Animal.find_by(id: params[:id])
    # erb vs redirect = all variable will be 'deleted' if redirected to another route (controller method)
    erb :"animals/show" 
  end 
  #find by species 
  #index of all  
end 