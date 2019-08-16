class FinstagramPost < ActiveRecord::Base
  
  belongs_to :user
  has_many :comment
  has_many :like
  
  validates_presence_of :photo_url, :user, presence: true
  
  def simple_time_ago
    
    sec = Time.now - self.created_at
    mins = sec/60
    hrs = mins/60
    days = hrs/24
    wks = days/7
    months = wks/30
    yrs = months/12
  
    if mins <= 1
      "just a moment ago"
    elsif mins < 60
      "#{mins.to_i} minutes ago"
    elsif hrs < 24
      "#{hrs.to_i} hours ago"
    elsif days < 7
      "#{days.to_i} days ago"
    elsif wks < 30
      "#{wks.to_i} weeks ago"
    elsif months < 12
      "#{months.to_i} months ago"
    else
      "#{yrs.to_i} years ago"
    end
  end
  
  def like_count
    self.like.size
  end

  def comment_count
    self.comment.size
  end
  
end
