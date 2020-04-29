# frozen_string_literal: true

require_relative 'Card.rb'
class Deck
  include Comparable
  attr_accessor :deck
  attr_accessor :deck_ranks
  attr_accessor :deck_suits
  attr_accessor :hand
  attr_accessor :table
  def initialize
    @deck_ranks = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @deck_suits = [0, 0, 0, 0]
    @deck = []
    @hand = []
    @table = []
    count = 0
    while count < 7
      temp = Card.new
      redo if count != 0 && deck.include?(temp)
      deck.push(temp)
      count += 1
    end
    hand_initialize
    table_initialize
    deck_ranks_and_suits_set
    print_hand
    print_table
    end

  def hand_initialize
    hand[0] = deck[0]
    hand[1] = deck[1]
  end

  def table_initialize
    t_count = 0
    while t_count < 5
      table[t_count] = deck[t_count + 2]
      t_count += 1
    end
   end

  def deck_ranks_and_suits_set
    d_count = 0
    while d_count < 7
      case deck[d_count].card_rank
      when '2'  then deck_ranks[0] += 1
      when '3'  then deck_ranks[1] += 1
      when '4'  then deck_ranks[2] += 1
      when '5'  then deck_ranks[3] += 1
      when '6'  then deck_ranks[4] += 1
      when '7'  then deck_ranks[5] += 1
      when '8'  then deck_ranks[6] += 1
      when '9'  then deck_ranks[7] += 1
      when '10' then deck_ranks[8] += 1
      when 'J'  then deck_ranks[9] += 1
      when 'Q'  then deck_ranks[10] += 1
      when 'K'  then deck_ranks[11] += 1
      when 'A'  then deck_ranks[12] += 1
      end
      case deck[d_count].card_suit
      when 'H'  then deck_suits[0] += 1
      when 'D'  then deck_suits[1] += 1
      when 'C'  then deck_suits[2] += 1
      when 'S'  then deck_suits[3] += 1
      end
    end
    end

  def print_hand
    puts "Hand is: \n #{hand[0]} #{hand[1]}"
  end

  def print_table
    puts "Table is: \n #{table[0]} #{table[1]} #{table[2]} #{table[3]} #{table[4]}"
  end
end
