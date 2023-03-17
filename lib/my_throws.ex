defmodule MyThrows do
  @moduledoc """
  Module to demonstrate the codes for the error handling using the Throw and Catch
  """

  @doc """
  Function to find the first multiple of 13 between given two numbers
  
  ## Example
      iex(13)> MyThrows.first_multiple_of_13_within(30, 50)
      "Got 39"
      iex(14)> MyThrows.first_multiple_of_13_within(15, 25)
      "Got Nothing!"
  """
  def first_multiple_of_13_within(from, to) do
    try do
      Enum.each(from..to, fn x ->
        if rem(x, 13) == 0, do: throw(x)
      end)

      "Got Nothing!"
    catch
      x -> "Got #{x}"
    end
  end
end
