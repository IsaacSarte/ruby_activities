# Polymorphism using Duck-Typing own example

class GraphicsCardVramOptions
    def type(vram)
        vram.type
    end
end

class HighEnd
    def type
        puts "You chose: 24gb vram options"
    end
end

class LowEnd
    def type
        puts "You chose: 4gb vram options"
    end
end

puts
customer_choice = GraphicsCardVramOptions.new
high_end = HighEnd.new
customer_choice.type(high_end)