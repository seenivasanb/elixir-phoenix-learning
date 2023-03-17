defmodule MySpecType do
  @moduledoc """
  Module to demonstrate the code for the Specification and Types in the Elixir code
  """

  @doc """
  Function to demonstrate the use of the @spec in the function definition
  
  ## Example
      iex> MySpecType.sum([1, 2, 3, 4])
      10
  """
  @spec sum([integer]) :: number
  def sum(list) do
    Enum.sum(list)
  end

  @doc """
  Function to demonstrate the code of @type and @typedoc attributes
  
  ## Example
      iex> MySpecType.age(1993)
      30
  """
  @typedoc """
  A 4 digit year, e.g 1993
  """
  @type year :: integer
  @spec age(year) :: integer
  def age(year_of_birth) do
    2023 - year_of_birth
  end

  @doc """
  Function to demonstrate the code for the complex custom type using Struct
  
  ## Example
      iex> MySpecType.score_board(%{name: "Seeni", marks: 67})
      "Seeni passed!"
      iex> MySpecType.score_board(%{name: "Vasan", marks: 25})
      "Vasan failed!"
  """
  defstruct name: nil, marks: nil
  @type student :: %MySpecType{name: String.t(), marks: integer}
  @spec score_board(student) :: String.t()
  def score_board(arg) do
    result = arg.marks > 40

    case result do
      true -> "#{arg.name} passed!"
      _ -> "#{arg.name} failed!"
    end
  end

  @doc """
  Function to demonstrate the code for the custom type with tuples
  
  ## Example
      iex> MySpecType.sum_with_notation(2, 4)
      {"2 + 4", 6}
  """
  @typedoc """
  A tuple contains string notation and sum of the numbers.
  e.g: {"2 + 4", 6}
  """
  @type result_with_notation :: {String.t(), number}
  @spec sum_with_notation(number, number) :: result_with_notation
  def sum_with_notation(x, y) do
    {"#{x} + #{y}", x + y}
  end
end
