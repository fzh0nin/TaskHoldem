# frozen_string_literal: true

require_relative 'Card'
require_relative 'Deck'
class DeckAnalyzer
  attr_accessor :is_flush, :flush_combination,\
                :is_pair, :pair_combination,\
                :is_three, :three_combination,\
                :is_four, :four_combination,\
                :is_full, :full_combination,\
                :is_two_pairs, :two_pairs_combination,\
                :is_straight, :straight_combination,\
                :is_straight_flush, :straight_flush_combination,\
                :is_flush_royal, :flush_royal_combination,\
                :is_high_card, :high_card_combination,\
                :winning, :winning_combination

  def initialize(deck)
    find_winning(deck)
  end

  def flush_royal?(deck)
    #to do
    is_flush_royal = false
  end

  def straight_flush?(deck)
    #to do
    is_straight_flush = false
  end

  def four?(deck)
    @is_four = true if deck.deck_ranks.include?(4)
  end

  def full_house?(deck)
    @is_full = true unless deck.deck_ranks.find_all \
    { |elem1, elem2| elem1 == 2 && elem2 == 3 }.empty?
  end

  def flush?(deck)
    @is_flush = true unless deck.deck_suits.find_all { |elem| elem > 4 }.empty?
  end

  def straight?(deck)
    count = 6
    while count >= 0
      if deck.deck_ranks[count] != 0 && deck.deck_ranks[count - 1] != 0\
      && deck.deck_ranks[count - 2] != 0 && deck.deck_ranks[count - 3] != 0\
      && deck.deck_ranks[count - 4] != 0
        return @is_straight = true
      end

      count -= 1
    end
  end

  def three?(deck)
    @is_three = true if deck.deck_ranks.include?(3)
  end

  def two_pairs?(deck)
    @is_two_pairs = true if deck.deck_ranks.find_all \
    { |elem| elem == 2 }.count > 1
  end

  def pair?(deck)
    @is_pair = true if deck.deck_ranks.include?(2)
  end

  def high_card?(deck)
    @is_high_card = true
  end

  def find_winning(deck)
    flush_royal?(deck)
    straight_flush?(deck)
    four?(deck)
    full_house?(deck)
    flush?(deck)
    straight?(deck)
    three?(deck)
    two_pairs?(deck)
    pair?(deck)
    high_card?(deck)
    if @is_flush_royal == true
      @winning = 'flush royale'
      @winning_combination = @flush_royal_combination
    elsif @is_straight_flush == true
      @winning = 'straight flush'
      @winning_combination = @straight_flush_combination
    elsif @is_four == true
      @winning = 'four'
      @winning_combination = @four_combination
    elsif @is_full == true
      @winning = 'full house'
      @winning_combination = @full_combination
    elsif @is_flush == true
      @winning = 'flush'
      @winning_combination = @flush_combination
    elsif @is_straight == true
      @winning = 'straight'
      @winning_combination = @straight_combination
    elsif @is_three == true
      @winning = 'three'
      @winning_combination = @three_combination
    elsif @is_two_pairs== true
      @winning = 'two pairs'
      @winning_combination = @two_pairs_combination
    elsif @is_pair == true
      @winning = 'pair'
      @winning_combination = @pair_combination
    else @winning = 'high card'
         @winning_combination = @high_card_combination
    end
    puts(@winning)
    #puts(@winning_combination)
  end

end
