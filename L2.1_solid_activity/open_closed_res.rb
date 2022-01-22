# Open/Closed Responsibility own example

class AudioConverter
    def initialize(uploader)
        @uploader = uploader
    end

    def convert(audio_file)
        case File.extname(audio_file).downcase
        when "mp3"
            Mp3Converter.new.convert(audio_file)
        when "wav"
            WavConverter.new.convert(audio_file)
        else
            raise FormatNotSupportedError, "File is not supported yet"
        end

        @uploader.save
    end
end

class Mp3Converter < AudioConverter
    def convert(audio_file)
        puts "Converting to mp3..."
    end
end

class WavConverter < AudioConverter
    def convert(audio_file)
        puts "Converting to wav..."
    end
end
