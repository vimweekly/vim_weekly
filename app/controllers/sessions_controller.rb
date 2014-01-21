class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by_email(params[:session][:email])
    if admin && admin.authenticate(params[:session][:password])
      session[:admin_id] = admin.id
      redirect_to url_for(:controller => :issues, 
                                      :action => :new_entry), :notice => "Logged in!"
    else
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path    
  end

  def entry
    
  end
end
