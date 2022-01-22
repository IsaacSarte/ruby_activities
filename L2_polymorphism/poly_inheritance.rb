# Polymorphism using Inheritance own example

class LaptopSize
    def initialize(model, size_inches)
        @model = model
        @size_inches = size_inches
    end

    def details_laptop
        puts "This is #{@model} with #{@size_inches} inches" 
    end
end

class Odyssey < LaptopSize
    def details_laptop
        puts "This is #{@model} with #{@size_inches} inches"
    end
end

class AOC < LaptopSize
    def details_laptop
        puts "This is #{@model} with #{@size_inches} inches"
    end
end

puts
samsung_odyssey = Odyssey.new("Samsung Odyssey G9", 27)
samsung_odyssey.details_laptop
aoc = AOC.new("AOC U series", 32)
aoc.details_laptop
