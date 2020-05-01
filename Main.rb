require_relative  'Card.rb'
require_relative  'Deck.rb'
#require_relative 'DeckAnalyzer'
puts'nachalo'
deck1 = Deck.new
puts 'Deck new'
deck1.hand_initialize
puts 'deck1 hand initialize'
deck1.table_initialize
puts'deck1 table initialize'
deck1.deck_ranks_and_suits_set
puts 'deck1.deck_ranks_and_suits_set'
deck1.print_hand
puts 'deck1.print_hand'
deck1.print_table
puts 'deck1.print_table'