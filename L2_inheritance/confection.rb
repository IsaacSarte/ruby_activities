# Question 1 - confection

class Confection
    def prepare
        "Baking at 350 degrees for 25 minutes. "
    end
end

class CupCake < Confection
    def prepare
        super
    end
end

class BananaCake < Confection
    def prepare
        super + "Apply frosting" # Mas mataas ang priority nito
    end
end

# CupCake
puts
cup_cake = CupCake.new
puts cup_cake.prepare

# BananaCake
banana_cake = BananaCake.new
puts
puts banana_cake.prepare # => Baking! Apply frosting