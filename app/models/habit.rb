class Habit < ActiveRecord::Base  
  has_many :checkins
  attr_accessible :name, :streek
  
end
