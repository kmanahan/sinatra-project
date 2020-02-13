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
end 