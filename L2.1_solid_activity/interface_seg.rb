# Interface Segregation Principle own example

class BuyAlbum
    def initialize(album_ordered, options = {})
        @album_ordered = album_ordered
        @options = options
    end

    def process!
        AvailableAlbum::Base.transaction do
            Payment::Order.new(@album_ordered).transact!
            AlbumCount::Quantity(@album_ordered).deduct!
            OrderMailer.successful_order(@album_ordered)
        end
    end
end