# Abstraction own example

class TabletDimension
    def initialize(model, width, height, viewport_width = 0, viewport_height = 0)
        @model = model
        @width = width
        @height = height
        @viewport_width = viewport_width
        @viewport_height = viewport_height
    end

    def total_size_pixels
        "#{@model} - #{@width} x #{@height}"
    end

    private

    def viewport_size_pixels
        "#{@viewport_width} x #{@viewport_height}"
    end
end

puts
tablet = TabletDimension.new("Samsung Galaxy Tab 10", 800,1280,800,1280)
puts tablet.total_size_pixels
