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

  it  'should  include dates no further than 7 days out' do
    expect(subject.slots.first.assignment_date).to be < Date.today + 7.days
  end

  context 'there are some slots already filled' do
    let!(:service_assignment) { Fabricate(:service_assignment, user: user, service: service, assignment_date: start) }

    it 'build a weeks worth of empty service Assignment objects' do
      expect(subject.slots.size).to eq 7
    end

    it 'grabs the slot that is already been taken' do
      expect(subject.slots.first).to eq service_assignment
    end

    it 'first slog should be taken' do
      expect(subject.slots.first).to be_taken
    end

  end
end
