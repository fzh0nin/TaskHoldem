# frozen_string_literal: true

require_relative 'Card.rb'
class Deck
  include Comparable

  def initialize
    @deck = []
    count = 0
    while count < 7
      temp = Card.new
      redo if count != 0 && @deck.include?(temp)
      @deck.push(temp)
      count += 1
    end
    @deck
  end

  def print_deck
    puts "Hand is: \n #{@deck[0]} #{@deck[1]} \n Table is: #{@deck[2]} #{@deck[3]} #{@deck[4]} #{@deck[5]} #{@deck[6]} #{@deck[7]}"
  end
  end
