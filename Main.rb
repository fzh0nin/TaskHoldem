# frozen_string_literal: true

require_relative  'Card.rb'
require_relative  'Deck.rb'
require_relative 'DeckAnalyzer'

(0..10).each do |_i|
  deck = Deck.new
  DeckAnalyzer.new(deck)
  puts("\n")
end
card1 = Card.new('9', 'C')
card2 = Card.new('K', 'D')
card3 = Card.new('Q', 'S')
card4 = Card.new('J', 'S')
card5 = Card.new('10', 'S')
deck2 = Deck.new(card1, card2, card3, card4, card5)
DeckAnalyzer.new(deck2)