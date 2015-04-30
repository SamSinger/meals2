class ServiceAssignmentsController < ApplicationController
  def create
    service_assignment_params[:service_assignment].select{|key, value| value[:taken] == "1" || value[:id].present? }.each do |key, value|
      if value[:id].present?        
        ServiceAssignment.find(value[:id]).destroy if value[:taken] == "0" 
      else
        ServiceAssignment.create(service_id: value[:service_id], assignment_date: value[:assignment_date], user_id: current_user.id)
      end
    end
    redirect_to service_path(12)
  end
  private

  def service_assignment_params
      params.permit(:service_assignment => [:id, :service_id, :assignment_date, :taken])
  end
end