class AccountsController < ApplicationController
  def main
    if session[:login_uid] != nil 
      render 'main'
    else
      render 'login'
    end
  end
  
  def login
    @account = Account.new
    uid = params[:account][:uid]
    pass = params[:account][:pass]
    if Account.find(uid: uid, pass: pass)
      session[:login_uid] = uid
      redirect_to 'error'
    else
      session[:login_uid] = nil
      render 'error'
    end
  
  end
  
  def logout
    session[:login_uid] = nil
    redirect_to 'main'
  end
  
  def error
    
  end
end
