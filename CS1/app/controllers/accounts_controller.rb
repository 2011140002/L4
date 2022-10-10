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
    if uid=='kindai' and pass=='sanriko'
      session[:login_uid] = uid
      redirect_to '/'
    else
      render 'error'
    end
  
  end
  
  def error
    
  end
end
