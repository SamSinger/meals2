require 'spec_helper'

describe "Service Assignment" do
  let(:user) { Fabricate(:user)}
  let(:service) {Fabricate(:service)}

  it 'a service assignment has a user and a service' do
    expect(ServiceAssignment.create(user: user, service: service).user).to eq user
    expect(ServiceAssignment.create(user: user, service: service).service).to eq service
  end
end
