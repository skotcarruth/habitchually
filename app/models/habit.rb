
class Habit < ActiveRecord::Base  
  has_many :checkins

  
  
  def can_checkin?(s,e)
    checkins = self.checkins.where("created_at >= ? AND created_at <= ?", s, e)
    if checkins.empty?
      return true
    else  
      return false
    end
  end
  
end
