
# card.rb

class Card
  attr_reader :value, :suit

  SUITS = [:hearts, :spades, :clubs, :diamonds]
  VALUES = (1..13)

  def initialize(value, suit)
    unless VALUES.include? value
      raise ArgumentError.new("Invalid value #{value}")
    end

    unless SUITS.include? suit
      raise ArgumentError.new("Invalid suit #{suit}")
    end

    @value = value
    @suit = suit
  end

  def to_s
    face = value
    case value
    when 1
      face = "Ace"
    when 11
      face = "Jack"
    when 12
      face = "Queen"
    when 13
      face = "King"
    end
    return "#{face} of #{suit.to_s}"
  end

end
