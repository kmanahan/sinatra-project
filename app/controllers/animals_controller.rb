class AnimalsController < ApplicationController 
  get "/animals" do 
    @animal = Animal.all 
    erb :"animals/index"
  end 
  
  #get new
  get "/animals/new" do 
    erb :"/animals/new"
  end 
  #post new 
  post "/animals" do 
    if !logged_in? 
      redirect "/"
    end 
    if params[:animals] != ""
    @animal = Animal.create(name: params[:name], species: params[:species], sex: params[:sex],farmer_id: current_user.id)
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
  
  get "/animals/:id/edit" do 
    @animal = Animal.find_by(params[:id])
    if logged_in?
      if @animal.farmers == current_user 
        erb :"animals/edit"
      else 
        redirect "farmers/#{current_user.id}"
      end
    else 
      redirect "/"
    end
  end 
  
  patch "/animals/:id" do 
    @animal = Animal.find_by(params[:id])
    @animal.update(name: params[:name], species: params[:species], sex: params[:sex])
    if logged_in?
      if @animal.farmers == current_user 
      erb :"animals/edit"
      else 
        redirect "farmers/#{current_user.id}"
      end
    else
      redirect "/animals/#{@animal.id}"
    end 
  end
  
  delete "/animals/:id" do 
    @animal = Animal.find_by(params[:id])
    if @animal.farmers == current_user 
      @animal.destroy
      redirect "/animals"
    else 
      redirect "/animals" 
    end
  end 
  
end 