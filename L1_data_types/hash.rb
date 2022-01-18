# Question 2 - hash
# Suppose you have a hash h = {a:1, b:2, c:3, d:4}. 
# Get the value of key :b Add to this hash the key:value pair {e:5}

# first solution for my first understanding
h = {:a => 1, :b => 2, :c => 3, :d => 4}
puts "Value of :b = #{h[:b]}" # print the value of :b
h.store(:e, 5) # store the key value pair :e,5 in the hash
puts "Updated hash h = #{h}" # print the hash h

# second solution for my second understanding
h = {:a => 1, :b => 2, :c => 3, :d => 4}
h[:b] # get the value of :b, which is 2
h.store(:e, 5)
h[:e] += h[:b] # add the value of h[:b] = 2 to the value of h[:e] = 5, total of :e = 7
puts "Updated hash h = #{h}" # print the hash h