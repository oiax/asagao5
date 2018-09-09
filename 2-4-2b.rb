class Robot
  def initialize(name)
    @name = name
    @x = @y = 0
  end

  def move(x, y)        # パブリックメソッド
    @x += x; @y += y
    crash if @x < 0 || @y < 0
  end

  private def crash     # プライベートメソッド
    puts "ドカン！"
  end
end

robo1 = Robot.new("ロボ1号")
robo1.move(200, -100)   # エラーは発生しない
robo1.crash             # エラーが発生する
