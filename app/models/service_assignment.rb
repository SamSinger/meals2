class ServiceAssignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :service

  def taken?
    persisted?
  end
end