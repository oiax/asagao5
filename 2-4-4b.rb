class Shape
  PI = 3.14159

  def self.circle(r)
    r * r * PI
  end
end

puts Shape::PI
puts Shape.circle(5)
