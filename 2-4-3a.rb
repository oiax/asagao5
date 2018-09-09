class Robot
  def name              # 名前の読み出し
    @name
  end

  def name=(name)       # 名前の書き込み
    @name = name
  end
end

robo1 = Robot.new
robo1.name = "ロボ1号"
puts robo1.name
