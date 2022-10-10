class AccountsController < ApplicationController
  def main
    if session[:login_uid] != nil 
      render root_path
    else
      render 'login'
    end
  end
  
  def login
    uid = params[:uid]
    pass = params[:pass]
    if Account.find_by(uid: params[:uid]) == nil
      session[:login_uid] = nil
      render 'error'
      
    else
      account = Account.find_by(uid: params[:uid])
      if account.pass == BCrypt::Password.new(pass)
        session[:login_uid] = uid
        redirect_to root_path
      else
        session[:login_uid] = nil
        render 'error'
      end
      
    end
  
  end
  
  def logout
    session[:login_uid] = nil
    redirect_to root_path
  end
  
  def error
    
  end
end
