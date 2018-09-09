s1 = "hello"
s2 = s1
puts s1.object_id
puts s2.object_id

s1.upcase!
puts s2
