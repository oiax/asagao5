class Robot
  def initialize(name)
    @name = name
    @x = @y = 0
  end

  def move(x, y)
    @x += x; @y += y
  end

  def to_s
    "#{@name}: #{@x},#{@y}"
  end
end

robo1 = Robot.new("ロボ1号") # ロボットのインスタンス1
robo2 = Robot.new("ロボ2号") # ロボットのインスタンス2
puts robo1
robo2.move(10, 20)
puts robo2
