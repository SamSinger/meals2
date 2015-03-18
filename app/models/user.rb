class User < ActiveRecord::Base
  has_many :service_assignments
  has_many :users, :through => :service_assignments
  
  validates_presence_of :email, :password, :firstname, :lastname, :organization_name
  validates_uniqueness_of :email

  has_secure_password validations: false
end