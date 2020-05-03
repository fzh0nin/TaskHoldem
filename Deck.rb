# frozen_string_literal: true

require_relative 'Card.rb'

class Deck
  include Comparable
  attr_accessor :deck_arr
  attr_accessor :deck_ranks
  attr_accessor :deck_suits
  attr_accessor :hand
  attr_accessor :table

  def initialize(card1 = nil, card2 = nil, card3 = nil, card4 = nil, card5 = nil, card6 = nil, card7 = nil)
    @deck_ranks = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @deck_suits = [0, 0, 0, 0]
    @deck_arr = []
    @hand = []
    @table = []
    add_card_to_deck(card1)
    add_card_to_deck(card2)
    add_card_to_deck(card3)
    add_card_to_deck(card4)
    add_card_to_deck(card5)
    add_card_to_deck(card6)
    add_card_to_deck(card7)
    hand_initialize
    print_hand
    table_initialize
    print_table
    deck_ranks_and_suits_set
  end

  def add_card_to_deck(card = nil)
    if card.nil?
      while true
      temp = Card.new
      redo if @deck_arr.include?(temp)
      @deck_arr.push(temp)
      break
      end
    else
      if @deck_arr.include?(card)
        raise ArgumentError
      else
        @deck_arr.push(card)
      end
    end
    end

  def hand_initialize
    @hand[0] = @deck_arr[0]
    @hand[1] = @deck_arr[1]
  end

  def table_initialize
    t_count = 0
    while t_count < 5
      @table[t_count] = @deck_arr[t_count + 2]
      t_count += 1
    end
  end

  def deck_ranks_and_suits_set
    d_count = 0
    while d_count < 7
      case @deck_arr[d_count].card_rank
      when '2'
        @deck_ranks[0] += 1
      when '3'
        @deck_ranks[1] += 1
      when '4'
        @deck_ranks[2] += 1
      when '5'
        @deck_ranks[3] += 1
      when '6'
        @deck_ranks[4] += 1
      when '7'
        @deck_ranks[5] += 1
      when '8'
        @deck_ranks[6] += 1
      when '9'
        @deck_ranks[7] += 1
      when '10'
        @deck_ranks[8] += 1
      when 'J'
        @deck_ranks[9] += 1
      when 'Q'
        @deck_ranks[10] += 1
      when 'K'
        @deck_ranks[11] += 1
      when 'A'
        @deck_ranks[12] += 1
      end
      case @deck_arr[d_count].card_suit
      when 'H'
        @deck_suits[0] += 1
      when 'D'
        @deck_suits[1] += 1
      when 'C'
        @deck_suits[2] += 1
      when 'S'
        @deck_suits[3] += 1
      end
      d_count += 1
    end
  end

  def print_hand
    puts "Hand is: \n #{@hand[0]} #{@hand[1]}"
  end

  def print_table
    puts "Table is: \n #{@table[0]} #{@table[1]} #{@table[2]} #{@table[3]} #{@table[4]}"
  end

  def print_ranks_set
    count = 0
    puts 'ranks set is:'
    while count < 13
      print "#{@deck_ranks[count]} "
      count += 1
    end
    puts
  end

  def print_suits_set
    count = 0
    puts 'suits set is:'
    while count < 4
      print "#{@deck_suits[count]} "
      count += 1
    end
    puts
  end
  end
