require 'spec_helper'

describe User do
  let(:user){ Fabricate(:user) }
    let(:service_assignment){ Fabricate(:service_assignment, user: user) }
  describe "relationships" do
    it 'a user has many service assignments' do
      expect(user.service_assignments).to include(service_assignment)
    end

    it 'a user belongs to service assignment' do
      expect(service_assignment.user).to eq user
    end
  end
  describe "validations" do     
    it "validates the presence of email" do
      expect(service_assignment.user.email).not_to be_empty  
    end
    it "validates the presense of password" do
      expect(service_assignment.user.password).not_to be_empty
    end
    it "validates the presence of firstname" do
      expect(service_assignment.user.firstname).not_to be_empty
    end  
    it "validates the presence of lastname" do
      expect(service_assignment.user.lastname).not_to be_empty
    end
    it "validates the presence of role" do
      expect(service_assignment.user.role).not_to be_empty
    end
    it "validates the presence of organization_name" do
      expect(service_assignment.user.organization_name).not_to be_empty      
    end
  end
end










