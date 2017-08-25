require_relative 'spec_helper'

describe Deck do
  # Write tests for the Deck class.
  # What should you test?
    # 1.  Expected Behavior
    # 2.  Edge cases

  describe "basics" do
    it "can be instantiated" do
      deck = Deck.new
      deck.must_be_instance_of Deck
    end

    it "creates a collection of 52 cards" do
      deck = Deck.new
      deck.must_respond_to :cards
      deck.cards.length.must_equal 52
      deck.cards.each do |card|
        card.must_be_instance_of Card
      end
    end
  end

  describe "draw" do
    it "returns a card" do
      deck = Deck.new
      card = deck.draw
      card.must_be_instance_of Card
    end

    it "removes the returned card from the deck" do
      deck = Deck.new
      card = deck.draw
      deck.cards.length.must_equal 51
      deck.cards.wont_include card
    end

    it "raises an error if there are no more cards" do
      deck = Deck.new
      51.times do
        deck.draw
      end
      deck.cards.length.must_equal 1

      # draw the last card
      deck.draw
      deck.cards.length.must_equal 0

      # try to draw again
      proc {
        deck.draw
      }.must_raise ArgumentError
    end
  end

  describe "shuffle" do
    it "does not change the number of cards" do
      deck = Deck.new
      deck.cards.length.must_equal 52
      deck.shuffle
      deck.cards.length.must_equal 52

      # Try after some cards have been drawn
      5.times do
        deck.draw
      end

      start_length = deck.cards.length
      deck.shuffle
      deck.cards.length.must_equal start_length
    end

    # Could check that the order of cards has changed, but
    # that's hard to do (and not technically guaranteed!)
  end
end
