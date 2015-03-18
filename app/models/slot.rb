class Slot < ActiveRecord::Base
belongs_to :user

  def open_dates
    slots = Slots.all
  end

end