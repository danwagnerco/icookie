class UsersController < ApplicationController
  # before_action :require_signin, :only => [:show]
  # before_action :require_correct_user, :only => [:show]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to success_path, :success => "Signup Successful!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, :success => "Account Successfully Updated!"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(parans[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, :success => "Account Successfully Deleted!"
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :zip, 
                                 :password, :password_confirmation, :report_detail)
  end

  # def require_correct_user
  #   @user = User.find(params[:id])
  #   redirect_to root_url unless current_user?(@user)
  # end

end
