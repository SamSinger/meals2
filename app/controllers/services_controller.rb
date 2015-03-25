class ServicesController < ApplicationController
  
  before_action :set_user, only: [:index, :show, :edit, :update]
  before_action :require_same_user, only: [:index, :show, :edit, :update]
  before_filter :require_user

  def index
    @services = Service.all
    
  end 

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to services_path
    else
      render :new
    end
  end 



   
  def show
    @service = Service.find(params[:id])
  end

  private

  def service_params
    params.require(:service).permit( :name, :user_id)
  end
  
end
