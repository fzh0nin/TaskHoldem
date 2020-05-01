# frozen_string_literal: true

require_relative  'Card.rb'
require_relative  'Deck.rb'
require_relative 'DeckAnalyzer'
deck1 = Deck.new
deck1.print_hand
deck1.print_table
DeckAnalyzer.new(deck1)
deck2 = Deck.new
deck2.print_hand
deck2.print_table
DeckAnalyzer.new(deck2)
deck3 = Deck.new
deck3.print_hand
deck3.print_table
DeckAnalyzer.new(deck3)
deck4 = Deck.new
deck4.print_hand
deck4.print_table
DeckAnalyzer.new(deck4)
deck5 = Deck.new
deck5.print_hand
deck5.print_table
DeckAnalyzer.new(deck5)



