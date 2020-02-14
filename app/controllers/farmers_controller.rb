class FarmersController < ApplicationController
  
  get "/login" do 
    erb :login
  end 

  post "/login" do 
   #params:username, 
   #find  
   @farmer = Farmer.find_by(username: params[:username])
   #authenticate 
   if @farmer && @farmer.authenticate(params[:password])
    session[:farmer_id] = @farmer.id
      redirect "/farmers/#{@farmer.id}"
   else 
    flash[:message] = "username and/or password in not valid. please try again."
     redirect "/login"
   end 
  end 
  
  get "/signup" do 
    erb :signup 
  end 
  
  post "/farmers" do 
    if params[:name] != "" &&  params[:username] != "" &&  params[:password] != ""
      #bonus: if username is already taken, error message to choose something else
      @farmer = Farmer.create(params) 
      redirect "/farmers/#{@farmer.id}"
    else 
      flash[:message] = "please fill out all boxes"
      redirect "signup"
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