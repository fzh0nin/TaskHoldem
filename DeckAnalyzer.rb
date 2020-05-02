# frozen_string_literal: true

require_relative 'Card'
require_relative 'Deck'

class DeckAnalyzer
  attr_reader :is_flush, :flush_combination, \
              :is_pair, :pair_combination, \
              :is_three, :three_combination, \
              :is_four, :four_combination, \
              :is_full, :full_combination, \
              :is_two_pairs, :two_pairs_combination, \
              :is_straight, :straight_combination, :high_card_straight_id, \
              :is_straight_flush, :straight_flush_combination, \
              :is_flush_royal, :flush_royal_combination, :royal_suit, \
              :is_high_card, :high_card_combination, \
              :winning, :winning_combination

  def initialize(deck)
    find_winning(deck)
  end

  # done
  def find_similar(deck, number, checked = nil)
    count = 12
    while count > 0
      break if deck.deck_ranks[count] == number && count != checked

      count -= 1
    end
    similar_cards_combination = deck.deck_arr.find_all \
    { |i| i.card_rank == RANKS_ARRAY[count] }
    [count, similar_cards_combination]
  end

  #done
  def flush_royal?(deck)
    # to do
    i = 0
    j = 12
    while i < 4
      while j > 8
        if deck.deck_arr.find_all { |elem| elem.card_rank == RANKS_ARRAY[j] && elem.card_suit == SUITS_ARRAY[i] }.any?
          j -= 1
          if j == 8
            @is_flush_royal = true
            @royal_suit = SUITS_ARRAY[i]
            return
          end
        else
          break
        end
      end
      i += 1
    end
    @is_flush_royal
  end

  #done
  def flush_royal_find(deck)
    count = 12
    while count >= 8
      @flush_royal_combination.push([RANKS_ARRAY[count], @royal_suit])
      count -= 1
    end

  end

  def straight_flush?(deck)
    #to do
  end

  # done
  def four?(deck)
    @is_four = true if deck.deck_ranks.include?(4)
  end

  # done
  def four_combination_find(deck)
    temp = find_similar(deck, 4)
    temp.delete_at(0)
    @four_combination = temp
  end

  # done
  def full_house?(deck)
    @is_full = true unless deck.deck_ranks.find_all \
    { |elem1, elem2| elem1 == 2 && elem2 == 3 }.empty?
  end

  # done
  def full_combination_find(deck)
    temp1 = find_similar(deck, 3)
    temp1.delete_at(0)
    temp2 = find_similar(deck, 2)
    temp2.delete_at(0)
    @full_combination = temp1 + temp2
  end

  # done
  def flush?(deck)
    @is_flush = true if deck.deck_suits.find_all { |elem| elem > 4 }.any?
  end

  # done
  def flush_combination_find(deck)
    @flush_combination = []
    count = 0
    while count < 4
      break if deck.deck_suits[count] > 4

      count += 1
    end
    temp = []
    i = 0
    while i < 13
      temp.push(deck.deck_arr.detect { |elem| elem.card_rank == RANKS_ARRAY[i] && elem.card_suit == SUITS_ARRAY[count] })
      i += 1
    end
    count = 0
    elem_number = 0
    while elem_number < 5
      unless temp[count].nil?
        @flush_combination.push(temp[count])
        elem_number += 1
      end
      count += 1
    end
  end

  # done
  def straight?(deck)
    count = 12
    while count > 4
      if deck.deck_ranks[count] > 0 && deck.deck_ranks[count - 1] > 0\
       && deck.deck_ranks[count - 2] > 0 && deck.deck_ranks[count - 3] > 0\
       && deck.deck_ranks[count - 4] > 0
        @is_straight = true
        @high_card_straight_id = count
      end
      count -= 1
    end
  end

  # done
  def straight_combination_find(deck)
    @straight_combination = []
    @high_card_straight_id
    count = 0
    while count < 5
      @high_card_straight_id -= 1
      count += 1
      @straight_combination.push(deck.deck_arr.detect \
      { |i| i.card_rank == RANKS_ARRAY[@high_card_straight_id] })
    end
  end

  # done
  def three?(deck)
    @is_three = true if deck.deck_ranks.include?(3)
  end

  # done
  def three_find(deck)
    temp = find_similar(deck, 3)
    temp.delete_at(0)
    @three_combination = temp
  end

  # done
  def two_pairs?(deck)
    @is_two_pairs = true if deck.deck_ranks.find_all \
    { |elem| elem == 2 }.count > 1
  end

  # done
  def two_pairs_find(deck)
    temp1 = find_similar(deck, 2)
    checked = temp1[0]
    temp1.delete_at(0)
    temp2 = find_similar(deck, 2, checked)
    temp2.delete_at(0)
    @two_pairs_combination = temp1 + temp2
  end

  # done
  def pair?(deck)
    @is_pair = true if deck.deck_ranks.include?(2)
  end

  # done
  def pair_find(deck)
    temp = find_similar(deck, 2)
    temp.delete_at(0)
    @pair_combination = temp
  end

  # done
  def high_card_find(deck)
    count = 12
    while count >= 0
      break if deck.deck_ranks[count] != 0

      count -= 1
    end
    @high_card_combination = deck.deck_arr.detect { |i| i.card_rank == RANKS_ARRAY[count] }
  end

  def find_winning(deck)
    flush_royal?(deck)
    flush_combination_find(deck) if @is_flush_royal
    straight_flush?(deck)
    four?(deck)
    four_combination_find(deck) if @is_four
    full_house?(deck)
    full_combination_find(deck) if @is_full
    flush?(deck)
    flush_combination_find(deck) if @is_flush
    straight?(deck)
    straight_combination_find(deck) if @is_straight
    three?(deck)
    three_find(deck) if @is_three
    two_pairs?(deck)
    two_pairs_find(deck) if @is_two_pairs
    pair?(deck)
    pair_find(deck) if @is_pair
    high_card_find(deck)
    if @is_flush_royal == true
      @winning = 'flush royale'
      @winning_combination = @flush_royal_combination.join(' ')
    elsif @is_straight_flush == true
      @winning = 'straight flush'
      @winning_combination = @straight_flush_combination
    elsif @is_four == true
      @winning = 'four'
      @winning_combination = @four_combination.join(' ')
    elsif @is_full == true
      @winning = 'full house'
      @winning_combination = @full_combination.join(' ')
    elsif @is_flush == true
      @winning = 'flush'
      @winning_combination = @flush_combination.join(' ')
    elsif @is_straight == true
      @winning = 'straight'
      @winning_combination = @straight_combination.join(' ')
    elsif @is_three == true
      @winning = 'three'
      @winning_combination = @three_combination.join(' ')
    elsif @is_two_pairs == true
      @winning = 'two pairs'
      @winning_combination = @two_pairs_combination.join(' ')
    elsif @is_pair == true
      @winning = 'pair'
      @winning_combination = @pair_combination.join(' ')
    else
      @winning = 'high card'
      @winning_combination = @high_card_combination
    end
    puts("Winning combination is:\n #{@winning}")
    puts("Winning cards are:\n #{@winning_combination}")
  end
end
