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
    logger.debug((Account.find_by(uid: uid, pass: pass)).inspect)
    if Account.find_by(uid: uid, pass: pass) == nil
      session[:login_uid] = uid
      redirect_to 'main'
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
