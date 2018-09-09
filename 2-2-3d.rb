arr = ["apple", "orange", "grape"]
arr.each_with_index do |item, i|
  print "#{i}.#{item}"
  print ", " if i < arr.length - 1
end
