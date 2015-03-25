class UsersController < ApplicationController
  def index
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #binding.pry
      redirect_to services_path
      flash[:notice] = "You are registered!"
    else
      render :new
      flash[:notice] ="Something went wrong"
    end
  end 


private

  def user_params
    params.require(:user).permit( :email, :password, :firstname, :lastname, :organization_name)
  end

end
