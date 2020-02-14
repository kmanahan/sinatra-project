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
    # if params[:name] != "" &&  params[:username] != "" &&  params[:password] != ""
    @farmer = Farmer.new(params)
     if @farmer.save
      # valid input
      session[:farmer_id] = @farmer.id # actually logging the user in
      # where do I go now?
      # let's go to the user show page
      redirect "/farmers/#{@farmer.id}"
    else
      # not valid input
      # it would be better to include a message to the user
      # telling them what is wrong

      flash[:message] = "Signup Failed, please try again"
      redirect '/signup'
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