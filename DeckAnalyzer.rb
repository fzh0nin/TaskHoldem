
require_relative 'Card'
require_relative 'Deck'
class DeckAnalizer
  #Combination= { royal_flush: 9, straight_flush: 8, four_of_a_kind: 7, full_house: 6, flush: 5, \
  #             straight: 4, three_of_a_kind: 3, two_pairs: 2, pair: 1 }.freeze
  Deck_ranks =[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  Deck_suits= [0, 0, 0, 0]

  def initialize(deck)
    deck_cards_ranks_set(deck)
    deck_suits_set(deck)
  end
  def deck_suits_set(deck)
    count=0
    while count<7 do
      if deck[count].instance_variable_get(card_suit) == "H"
        Deck_suits[0]+=1
      elsif deck[count].instance_variable_get(card_suit) == "D"
        Deck_suits[1]+=1
      elsif deck[count].instance_variable_get(card_suit) == "C"
        Deck_suits[2]+=1
      else
        Deck_suits[3]+=1
      end
    end
  end
  def deck_cards_ranks_set(deck)
    count=0
    while count<7 do
    if deck[count].instance_variable_get(card_rank) == "2"
      Deck_ranks[0]+=1
      elseif deck[count].instance_variable_get(card_rank) == "3"
      Deck_ranks[1]+=1
      elseif deck[count].instance_variable_get(card_rank) == "4"
      Deck_ranks[2]+=1
      elseif deck[count].instance_variable_get(card_rank) == "5"
      Deck_ranks[3]+=1
      elseif deck[count].instance_variable_get(card_rank) == "6"
      Deck_ranks[4]+=1
      elseif deck[count].instance_variable_get(card_rank) == "7"
      Deck_ranks[5]+=1
      elseif deck[count].instance_variable_get(card_rank) == "8"
      Deck_ranks[6]+=1
      elseif deck[count].instance_variable_get(card_rank) == "9"
      Deck_ranks[7]+=1
      elseif deck[count].instance_variable_get(card_rank) == "10"
      Deck_ranks[8]+=1
      elseif deck[count].instance_variable_get(card_rank) == "J"
      Deck_ranks[9]+=1
      elseif deck[count].instance_variable_get(card_rank) == "Q"
      Deck_ranks[10]+=1
      elseif deck[count].instance_variable_get(card_rank) == "K"
      Deck_ranks[11]+=1
      elseif deck[count].instance_variable_get(card_rank) == "A"
      Deck_ranks[12]+=1
    end
  end
  end
  #  def aaaaa

  #  count=0
  # while count <4 do
  #   puts(Deck_suits[count])
  # end
  #
  end

