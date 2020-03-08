defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "createDeck makes 20 cards" do
    assert length(Cards.createDeck()) == 52
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.createDeck()
    assert deck != Cards.shuffle(deck)
    # refute deck == Cards.shuffle(deck)
  end
end
