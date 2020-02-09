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
    puts session
    redirect "/farmers/#{@farmer.id}"
   else 
   end 
  end 
  
  get "/signup" do 
    erb :signup 
  end 
  
  post "/farmers" do 
    if params[:name] != "" &&  params[:username] != "" &&  params[:password] != ""
      @farmer = Farmer.create(params) 
      redirect "/farmers/#{@farmer.id}"
    else 

    end
      
  end 
  
  get "/farmers/:id" do 
    @farmer = Farmer.find_by(id: params[:id])
    erb :"/farmers/show"
  end 
end 