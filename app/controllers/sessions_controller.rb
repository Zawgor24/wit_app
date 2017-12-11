class SessionsController < ApplicationController
  def destroy
    User.find(session[:user_id]).destroy      
    session[:user_id] = nil         
    redirect_to root_path 
  end 
end