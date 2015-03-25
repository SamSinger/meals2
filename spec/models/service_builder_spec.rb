require 'spec_helper'

describe "ServiceBuilder" do
  let!(:user) { Fabricate(:user)}
  let!(:service) { Fabricate(:service) }
  let!(:start) { Date.today }

  subject { ServiceBuilder.new(user, start)}
  it 'build a weeks worth of empty service Assignment objects' do
    expect(subject.slots.size).to eq 7
  end

  it 'has to be a service Assignment object' do
    expect(subject.slots.last.class).to eq ServiceAssignment
  end

  it 'has to be the current user assigned to the assignment' do
    expect(subject.slots.first.user).to eq user
  end

  it  'should be include dates further than 7 days out' do
    expect(subject.slots.first.assignment_date).to be < Date.today + 7.days
  end
end
