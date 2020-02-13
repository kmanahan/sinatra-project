class AnimalsController < ApplicationController 
  get "/animals" do 
     if !logged_in? 
      redirect "/"
    else
    @animal = animal.current_user 
    erb :"animals/index"
  end
  end 
  
  #get new
  get "/animals/new" do 
    if !logged_in? 
      redirect "/"
    end 
    if
      erb :"/animals/new"
    end
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
    animal_item 
     if logged_in? 
       if authorized?(@animal)
        erb :"/animals/edit" 
       else 
         redirect "animals/#{current_user.id}"
       end 
     else 
       redirect "/" 
     end
  end
  
  patch "/animals/:id" do 
    animal_item 
     if logged_in? 
       if authorized?(animal)
        animal.update(name: params[:name], species: params[:species], sex: params[:sex])
       else 
        redirect "farmers/#{current_user.id}"
       end 
     else 
       redirect "/"
     end
  end
  
  delete "/animals/:id" do 
    @animal = Animal.find(params[:id])
    # if @animal.farmers == current_user 
      @animal.destroy
      redirect "/animals"
    # else 
    #   redirect "/animals" 
    # end
  end 
  
  private 
  
  def animal_item 
    @animal = Animal.find_by(params[:id])
  end 
  
end 