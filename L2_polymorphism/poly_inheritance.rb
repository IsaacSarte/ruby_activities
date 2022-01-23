# Polymorphism using Inheritance own example

class LaptopSize
    def size_inches
        "Size: "
    end
end

class Odyssey < LaptopSize
    def size_inches
        super
        print " 27 inches"
    end
end

class AOC < LaptopSize
    def size_inches
        super
        print " 32 inches"
    end
end

puts
samsung_odyssey = Odyssey.new()
samsung_odyssey.size_inches
puts
aoc = AOC.new()
aoc.size_inches
