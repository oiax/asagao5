module Radar
  def distance_to(other)
    Math.sqrt((self.x - other.x) ** 2 + (self.y - other.y) ** 2)
  end
end

class Robot
  include Radar
  attr_accessor :name, :x, :y

  def initialize(name)
    @name = name
    @x = @y = 0
  end

  def move(x, y)
    @x += x; @y += y
  end
end

robo1 = Robot.new("ロボ1号")
robo2 = Robot.new("ロボ2号")
robo2.move(12, 35)
puts "距離は #{robo1.distance_to(robo2)} です。"
