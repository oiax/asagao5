def triangle(params)
  params[:base] * params[:height] / 2.0
end
area = triangle(height: 3.4, base: 2.3)
puts "三角形の面積：#{area}"
