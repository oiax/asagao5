print "価格を入力してください："
num = gets.to_i
if num >= 1500
  puts "送料無料です。"
elsif 0 < num && num < 1500
  puts "送料300円です。"
else
  puts "入力が間違っています。"
end
