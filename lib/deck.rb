
# deck.rb

require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    [:hearts, :spades, :clubs, :diamonds].each do |suit|
      (1..13).each do |value|
        @cards << Card.new(value, suit)
      end
    end
  end

  def draw
    if @cards.length < 1
      raise ArgumentError.new("Not enough cards")
    end
    return @cards.pop
  end

  def shuffle
    @cards.shuffle
  end
end
