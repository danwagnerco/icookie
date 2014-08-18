class SessionsController < ApplicationController

  def new
    render
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id]  = user.id
      flash[:success]    = "Welcome back #{user.first_name}!"
      redirect_to user
    else
      flash.now[:danger] = "Invalid email/password combination!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :success => "You Have Successfully Signed Out!"
  end

end
