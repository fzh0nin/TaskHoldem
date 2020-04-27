class Card
  include Comparable
  Ranks_array = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  Suits_array = %w[H D C S].freeze
  attr_reader :card_rank, :card_suit
  def initialize
      @card_rank = Ranks_array.sample
      @card_suit = Suits_array.sample
    end

  def <=> (other)
    card_rank = other.card_rank
    card_suit = other.card_suit
  end
  def ==(other)
    if card_rank == other.card_rank && \
       card_suit == other.card_suit
      true
    else
      false
     end
  end

  def to_s
    card_rank + card_suit
  end
end
