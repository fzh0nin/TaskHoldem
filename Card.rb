# frozen_string_literal: true

RANKS_ARRAY = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
SUITS_ARRAY = %w[H D C S].freeze

class Card
  include Comparable
  attr_reader :card_rank, :card_suit

  def initialize
    @card_rank = RANKS_ARRAY.sample
    @card_suit = SUITS_ARRAY.sample
  end

  def <=>(other)
    @card_rank = other.card_rank
    @card_suit = other.card_suit
  end

  def ==(other)
    if @card_rank == other.card_rank && \
       @card_suit == other.card_suit
      true
    else
      false
    end
  end

  def to_s
    @card_rank + @card_suit
  end
end
