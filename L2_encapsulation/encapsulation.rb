# Encapsulation own example

class PhoneDimension
    def initialize(model, width, height)
        @model = model
        @width = width
        @height = height
    end

    def total_size_pixels
        "#{@model} - #{@width} x #{@height}"
    end
end

puts
phone = PhoneDimension.new("iPhone 12 Pro Max",2778,1284)
phone_v2 = PhoneDimension.new("Samsung Galaxy Note 9",1440,2960)
puts phone.total_size_pixels
puts phone_v2.total_size_pixels
