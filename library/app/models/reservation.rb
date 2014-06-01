class Reservation < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

def is_overdue?
  Time.now > self.due_on
end

end