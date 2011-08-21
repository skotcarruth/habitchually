
class Habit < ActiveRecord::Base  
  has_many :checkins

   
  def can_checkin?(s,e)
    p s
    p e
    
    checkins = self.checkins.where("created_at >= ? AND created_at <= ?", s, e)
    p checkins
    if checkins.empty?
      return true
    else  
      return false
    end
  end
  
end
