defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """
  @doc """
  Returns a list of strings representing a deck of playing cards

  """
  def createDeck do
    values = [
      "Ace",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
      "Ten",
      "Jack",
      "Queen",
      "King"
    ]

    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Returns a shuffled deck
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether a deck contains a given card

  ## Examples
      iex> deck = Cards.createDeck
      iex> Cards.contains? deck, "Ace of Spades"
      true

  """
  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  @doc """
  Divides a deck into a hand and the remainder of the deck.
  The `handSize` argument indicates how many cards should be in the hand.


  ## Examples

      iex> deck = Cards.createDeck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, handSize) do
    Enum.split(deck, handSize)
  end

  @doc """
    Save a deck to a file
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Load a deck from a file
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File does not exist"
    end
  end

  def createHand(handSize) do
    # Pipe operator |>
    Cards.createDeck()
    |> Cards.shuffle()
    |> Cards.deal(handSize)
  end
end
