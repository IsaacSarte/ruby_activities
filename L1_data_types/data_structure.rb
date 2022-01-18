# Question 3 - data structure
# Given the following data structures. 
# Write a program that copies the information from the array 
# into the empty hash that applies to the correct person. 

contact_data = [["john@email.com", "123 Main st.", "555-123-4567"],
            ["avion@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"John Cruz" => {}, "Avion School" => {}}

# Expected output:
#  {
#    "John Cruz"=>{:email=>"john@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
#    "Avion School"=>{:email=>"avion@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
#  }

# John Cruz Details
contacts["John Cruz"] = {
    :email => contact_data[0][0],
    :address => contact_data[0][1],
    :phone => contact_data[0][2]
}

# Avion School Details
contacts["Avion School"] = {
    :email => contact_data[1][0],
    :address => contact_data[1][1],
    :phone => contact_data[1][2]
}

puts "John Cruz: #{contacts["John Cruz"]}"
puts "\n"
puts "Avion School: #{contacts["Avion School"]}"