# Question 4 - divisible
# Below we have given you an array and a number.
# Write a program that checks to see if the number 
# is divisible by 2 and store them into a new array. 

# Creating the default array
arr = [6,3,1,8,4,2,10,65,102]
# Setting the new array
new_arr = []

# Looping inside the array to push it into the new array
arr.each {|i| 
    if i % 2 == 0 
        new_arr.push(i)
    end
}

# Print the new array
puts "#{new_arr}"