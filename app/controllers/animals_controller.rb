class AnimalsController < ApplicationController 
  get "/animals" do 
     if !logged_in? 
      redirect "/"
    else
    @animal = current_user.animals
    erb :"animals/index"
  end
  end 
  
  #get new
  get "/animals/new" do 
    if !logged_in? 
      flash[:message] = "please login first"
      redirect "/"
   else
      erb :"/animals/new"
    end
  end 
  
  #post new 
  post "/animals" do 
    if !logged_in? 
      redirect "/"
    end 
    #create new animal
    @animal = Animal.new(params)
    # make sure input is valid (ActiveRecord method)
      if @animal.valid?
        @animal.save
         @animal = current_user.animals.create(params)
      redirect "/animals/#{@animal.id}"
    else
      flash[:message] = "something went wrong"
      redirect "/animals/new"
    end 
  end

  get "/animals/:id" do
    animal_item
    if logged_in?
      if authorized?(@animal)
  #find by id, dynamic route => look for better definition
  # @animal = Animal.find_by(id: params[:id])
   # erb vs redirect = all variable will be 'deleted' if redirected to another route (controller method)
    erb :"animals/show" 
  else 
    flash[:message] = "oops, you do not have access to this page"
    redirect "/animals" 
  end
  end
  end 
  
  get "/animals/:id/edit" do 
    animal_item 
      if logged_in?
        if authorized?(@animal)
        erb :"/animals/edit" 
      else 
          flash[:message] = "oops, you do not have access to this page"
         redirect "/animals/#{current_user.id}"
       end
     end
  end
  
  patch "/animals/:id" do 
    animal_item 
       if logged_in? 
         if authorized?(@animal)
         if @animal.valid?
        @animal.update(name: params[:name], species: params[:species], sex: params[:sex])
        redirect "/animals/#{@animal.id}"
       else 
        redirect "/farmers/#{current_user.id}/edit"
      end
      end
     end
  end
  
  delete "/animals/:id" do 
    @animal = Animal.find(params[:id])
    if authorized?(@animal)
      @animal.destroy
      redirect "/animals"
    else 
      redirect "/animals" 
    end
  end 
  
  private 
  
  def animal_item 
    @animal = Animal.find(params[:id])
  end 
  
  def redirect_if_not_logged_in 
  end 

end 