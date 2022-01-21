class HeadPhones
    def initialize(brand, model)
        @brand = brand
        @model = model
    end

    def brand_names
        @brand
    end

    def model_names
        @model
    end
end

headphones = HeadPhones.new('Audio Technica', 'ATH-M50x')

brand_name = headphones.brand_names()
model_name = headphones.model_names()

puts "I want a/an #{brand_name} - #{model_name} Headphones"

# ===================================================

# Inheritance
class Animal
    def speak
        "Hello!"
    end
    
    def swim
        "Im swimming from Animal"
    end
end

class GoodDog < Animal
    def speak
        super + " from GoodDog class" # Mas mataas ang priority nito
    end
end

sparky = GoodDog.new
print sparky.speak # => Hello! from GoodDog class

# Interface Inheritance
module Swimmable
    def swim
        "Im swimming from Swimmable"
    end
end

class Fish < Animal
    include Swimmable
end

dory = Fish.new
puts dory.swim