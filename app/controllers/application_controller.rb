require './config/environment'
# require 'sinatra/flash' dont need because already in environment

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash
  end

  get "/" do
    if logged_in? 
      redirect "/farmers/#{current_user.id}"
    else
    erb :welcome
    end
  end
  
  helpers do 
    
    def current_user 
      @current_user ||= Farmer.find_by(id: session[:farmer_id])
    end 
    
    def logged_in? 
      !!current_user 
    end
    
    def authorized?(animal)
      animal.farmer == current_user
    end
 end
end
