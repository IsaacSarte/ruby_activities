# Question 3 - stop
# Write a while loop that takes input from the user, performs an action,
# and only stops when the user types "STOP". 
# Each loop can get info from the user. 

# Variable Declaration
call = ""

# While loop
while call != "STOP"
    puts "What are you doing? "
    ans = gets.chomp
    puts "What again are you doing today? "
    call = gets.chomp
end
