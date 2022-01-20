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
