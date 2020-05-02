# frozen_string_literal: true

require_relative  'Card.rb'
require_relative  'Deck.rb'
require_relative 'DeckAnalyzer'

(0..10).each do |_i|
  deck = Deck.new
  deck.print_hand
  deck.print_table
  DeckAnalyzer.new(deck)
  puts("\n")
end
