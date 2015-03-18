class Service < ActiveRecord::Base
  has_many :service_assignments
  has_many :users, :through => :service_assignments
end