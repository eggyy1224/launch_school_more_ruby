require 'pry'

class Clock

  attr_accessor :hour, :minute

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute=0)
    Clock.new(hour, minute)
  end

  def to_s
    if minute >= 60 || minute < 0
      add = minute / 60
      remain = minute % 60
      self.hour += add
      self.minute = remain
    end

    if hour >= 24 
      self.hour = hour % 24 
    end

    if hour < 0
      self.hour += 24
    end
    "#{format("%02d", hour)}:#{format("%02d", minute)}"
  end

  def +(min)
    self.minute += min
    self
  end

  def -(min)
    self.minute -= min
    self
  end

  def ==(other_clock)
    self.to_s == other_clock.to_s
  end
  
end
