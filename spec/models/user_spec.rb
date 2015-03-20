require 'spec_helper'

describe User do
  describe "relationships" do
    let(:user){ Fabricate(:user) }
    let(:service_assignment){ Fabricate(:service_assignment, user: user) }

    it 'a user has many service assignments' do
      expect(user.service_assignments).to include(service_assignment)
    end

    it 'a user belongs to service assignment' do
      expect(service_assignment.user).to eq user
    end
  end
end
