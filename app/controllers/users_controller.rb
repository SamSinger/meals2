class UsersController < ApplicationController
  def index
    @users = User.all      
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
      params.require(:user).permit(:id, :role, :firstname, :lastname, :email, :password, :organization_name)
    end

    def set_user
      @user = User.find_by id: params[:id]
    end

    def require_same_user #but allow admin
      if ! current_user.admin? && current_user != @user
      flash[:error] = "You're not allowed to do that."
      redirect_to root_path
    end
  end

end
