class ServiceBuilder
  attr_reader :start_date, :user

  def initialize(user, start_date)
    @user = user
    @start_date = start_date
  end

  def slots
    slots = []
    start_date.upto(start_date + 6.days).each do |day|
      Service.all.each do |service|
        slots << ServiceAssignment.find_or_initialize_by(user: user, assignment_date: day, service: service)
      end      
    end
    slots
  end
end