class SlotsController < ApplicationController
  
  before_action :set_user, only: [:index, :show, :edit, :update]
  before_action :require_same_user, only: [:index, :show, :edit, :update]
  before_filter :require_user

  def index
    @slots = Slot.all
    
  end 

  def new
    @slot = Slot.new
  end

  def create
    @slot = Slot.new(slot_params)
    if @slot.save
      redirect_to slots_path
    else
      render :new
    end
  end 



   
  def show
    @slot = Slot.find(params[:id])
  end

  private

  def slot_params
    params.require(:slot).permit( :which_meal, :prepare_serve_meal, :provide_fellowship, :user_id)
  end
  
end
