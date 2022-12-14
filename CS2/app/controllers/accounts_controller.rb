class AccountsController < ApplicationController
  def main
    if session[:login_uid] != nil 
      render 'main'
    else
      render 'login'
    end
  end
  
  def login
    uid = params[:uid]
    pass = params[:pass]
    if Account.find_by(uid: params[:uid], pass: params[:pass]) == nil
      session[:login_uid] = nil
      render 'error'
      
    else
      session[:login_uid] = uid
      redirect_to root_path
      
    end
  
  end
  
  def logout
    session[:login_uid] = nil
    redirect_to root_path
  end
  
  def error
    
  end
end
