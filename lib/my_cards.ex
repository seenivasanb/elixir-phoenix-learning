defmodule MyCards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards
  """

  @doc """
  Creating the deck with the items
  
  ## Examples
      iex> MyCards.create_deck
      ["Ace", "Two", "Three"]
  """
  def create_deck do
    ["Ace", "Two", "Three"]
  end

  @doc """
  Prepanding the given Card to the Deck.
  
  ## Examples
      iex> deck = MyCards.create_deck
      ["Ace", "Two", "Three"]
      iex> MyCards.prepand_card(deck, "King")
      ["King", "Ace", "Two", "Three"]
  """
  def prepand_card(deck, card) do
    [card | deck]
  end

  @doc """
  Appending the given Card to the Deck.
  
  ## Examples
      iex> deck = MyCards.create_deck
      ["Ace", "Two", "Three"]
      iex> MyCards.append_card(deck, "Four")
      ["Ace", "Two", "Three", "Four"]
  """
  def append_card(deck, card) do
    deck ++ [card]
  end

  @doc """
  Concatinating the given two lists
  
  ## Examples
      iex> MyCards.list_concatenation
      ["Ace", "Two", "King", "Queen"]
  """
  def list_concatenation do
    ["Ace", "Two"] ++ ["King", "Queen"]
  end

  @doc """
  Subtracting the given list from the given deck
  
  ## Examples
      iex> MyCards.list_subtraction
      ["Ace", "Three"]
  """
  def list_subtraction do
    ["Ace", "Two", "Three"] -- ["Two"]
  end

  @doc """
  Retrieving the first element from the list
  
  ## Examples
      iex> MyCards.get_head
      "Ace"
  """
  def get_head do
    [head | _tail] = ["Ace", "Two", "Three"]
    head
  end

  @doc """
  Retrieving the elements expect the first element from the list
  
  ## Examples
      iex> MyCards.get_tail
      ["Two", "Three"]
  """
  def get_tail do
    [_head | tail] = ["Ace", "Two", "Three"]
    tail
  end

  @doc """
  Shuffling the elements in the list
  
  ## Examples
      iex> deck = MyCards.create_deck
      ["Ace", "Two", "Three"]
      iex> MyCards.shuffle(deck)
      ["Two", "Three", "Ace"]
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Searching the element in the list
  
  ## Examples
      iex> deck = MyCards.create_deck
      ["Ace", "Two", "Three"]
      iex> MyCards.contains(deck, "Two")
      true
      iex> MyCards.contains(deck, "King")
      false
  """
  def contains(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Iterating the items in the given list
  
  ## Examples
      iex> MyCards.list_iteration
      ["This is a Ace", "This is a Two", "This is a Three"]
  """
  def list_iteration do
    deck = ["Ace", "Two", "Three"]

    for card <- deck do
      "This is a #{card}"
    end
  end

  @doc """
  Iterating the items from the multiple iteration
  
  ## Examples
      iex> MyCards.multiple_list_iteration
      [
        ["Ace of Spade", "Ace of Hearts"],
        ["Two of Spade", "Two of Hearts"],
        ["Three of Spade", "Three of Hearts"]
      ]
  """
  def multiple_list_iteration do
    values = ["Ace", "Two", "Three"]
    suits = ["Spade", "Hearts"]

    for value <- values do
      for suit <- suits do
        "#{value} of #{suit}"
      end
    end
  end

  @doc """
  Refined solution to iterate the elements from the multiple lists
  
  ## Examples
      iex> MyCards.refined_multiple_list_iteration
      ["Ace of Spade", "Ace of Hearts", "Two of Spade", "Two of Hearts",
      "Three of Spade", "Three of Hearts"]
  """
  def refined_multiple_list_iteration do
    values = ["Ace", "Two", "Three"]
    suits = ["Spade", "Hearts"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  @doc """
  Spliting the no of elements from the list
  
  ## Examples
      iex> deck = MyCards.create_deck
      ["Ace", "Two", "Three"]
      iex> MyCards.deal(deck, 2)
      ["Ace", "Two"]
      iex> MyCards.deal(deck, 1)
      ["Ace"]
  """
  def deal(deck, hand_size) do
    {hand, _rest_of_deck} = Enum.split(deck, hand_size)
    hand
  end

  @doc """
  Converting the given deck in to binary and store in the given file name
  
  ## Examples
      iex> deck = MyCards.create_deck
      ["Ace", "Two", "Three"]
      iex> MyCards.save("my_file")
      :ok
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Retrieving the binary data from the given file name and converting it to the term
  
  ## Examples
      iex> MyCards.load("my_file")
      ["Ace", "Two", "Three"]
      iex> MyCards.load("asdf")
      ** (ArgumentError) errors were found at the given arguments:
  
      * 1st argument: not a binary
  
        :erlang.binary_to_term(:enoent)
        (first_app 0.1.0) lib/cards.ex:214: MyCards.load/1
        iex:20: (file)
  """
  def load(filename) do
    {_status, binary} = File.read(filename)
    :erlang.binary_to_term(binary)
  end

  @doc """
  Pattern matching in the case statements
  
  ## Examples
      iex> MyCards.load_with_error_handling("my_file")
      ["Ace", "Two", "Three"]
      iex> MyCards.load_with_error_handling("asdf")
      "File does not exists"
  """
  def load_with_error_handling(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File does not exists"
    end
  end

  @doc """
  Creating the hand of cards to play a game by calling the multiple functions
  
  ## Examples
      iex> MyCards.create_hand(2)
      ["Three", "Ace"]
      iex> MyCards.create_hand(3)
      ["Ace", "Three", "Two"]
  """
  def create_hand(hand_size) do
    MyCards.create_deck()
    |> MyCards.shuffle()
    |> MyCards.deal(hand_size)
  end
end
