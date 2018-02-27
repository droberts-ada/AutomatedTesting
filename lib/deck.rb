
# deck.rb

require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        @cards << Card.new(value, suit)
      end
    end
  end

  def draw
    raise StandardError.new('Deck is empty') if @cards.empty?
    return @cards.pop
  end

  def shuffle
    @cards.shuffle!
  end
end
