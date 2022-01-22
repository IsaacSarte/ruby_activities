# Dependency Inversion own example

class Producer
    def produce(song)
        Beats.new.play(song)
    end
end

class Beats
    def play(song)
        puts song
    end
end

puts
wasak_beats = Producer.new
wasak_beats.produce("New Song")