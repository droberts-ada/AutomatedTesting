

require_relative 'spec_helper'

describe Deck do
  before do
    @deck = Deck.new
  end
  describe 'constructor' do
    it 'can be created' do
      @deck.must_be_instance_of Deck
    end

    it 'creates a list of 52 cards' do
      @deck.cards.must_be_instance_of Array
      @deck.cards.length.must_equal 52
      @deck.cards.each do |card|
        card.must_be_instance_of Card
      end

      # Will only pass if you say something = Object.new
      # something.must_be_instance_of Object
      # Will always pass, because every class is
      # a subclass of Object
      # something.must_be_kind_of Object
    end
  end

  describe 'shuffle' do
    it 'is a method you can call' do
      @deck.must_respond_to :shuffle
      @deck.shuffle
    end
  end

  describe 'draw' do
    it 'returns a card' do
      card = @deck.draw
      card.must_be_instance_of Card
    end

    it 'removes that card from the deck' do
      start_length = @deck.cards.length

      card = @deck.draw

      (@deck.cards.include? card).must_equal false
      @deck.cards.length.must_equal start_length - 1
    end

    # Interesting edge case: What happens at the bottom
    # of the deck?
    # Expected behavior: you can draw the last card, but
    # after that you get an error
    it 'lets you draw all 52 cards' do
      52.times do
        @deck.draw
      end
      @deck.cards.must_be :empty?
    end

    it 'raises an error when the deck is empty' do
      52.times do
        @deck.draw
      end

      proc {
        @deck.draw
      }.must_raise
    end
  end

  describe 'count' do
  end
end
