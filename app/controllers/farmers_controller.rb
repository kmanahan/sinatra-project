class FarmersController < ApplicationController
  
  get "/login" do 
    erb :login
  end 

  post "/login" do 
   #params:username, 
   #find  
   @farmer = Farmer.find_by(username: params[:username])
   #authenticate 
   if @farmer.authenticate(params[:password])
    session[:farmer_id] = @farmer.id
    redirect "/animals"
   else 
    # flash[:message] = "Something went wrong. Please try again."
     erb :"animals/login"
   end 
  end 
  
  get "/signup" do 
    erb :signup 
  end 
  
  post "/farmers" do 
    if params[:name] != "" &&  params[:username] != "" &&  params[:password] != ""
      #if username is already taken, error message to choose something else
      @farmer = Farmer.create(params) 
      redirect "/farmers/#{@farmer.id}"
    else 
      redirect "signup"
      #create error message
    end
      
  end 
  
  get "/farmers/:id" do 
    @farmer = Farmer.find_by(id: params[:id])
    erb :"/farmers/show"
  end 
  
  get "/logout" do 
    session.clear 
    redirect "/"
  end 
  
  get "/farmers/:id/edit" do 
    # find_farmer
      if logged_in? && current_user == @farmer.id
        erb :"/farmers/edit" 
      else 
         redirect "farmers/#{current_user.id}"
     end
  end
  
  patch "/farmers/:id" do 
    # find_farmer
       if logged_in? && current_user == @farmer.id
        @farmer.update(name: params[:name], farm_name: params[:farm_name], user: params[:user], username: params[:username], password: params[:password_digest])
        redirect "/farmers/#{@farmer.id}"
       else 
        redirect "farmers/#{current_user.id}/edit"
     end
  end
  
  # delete "/animals/:id" do 
  #   @animal = Animal.find(params[:id])
  #   # if @animal.farmers == current_user 
  #     @animal.destroy
  #     redirect "/animals"
  #   # else 
  #   #   redirect "/animals" 
  #   # end
  # end 
  
  private 
  def find_farmer 
    @farmer = Farmer.find(params[:id])
  end 
  
end 