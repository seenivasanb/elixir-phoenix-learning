defmodule MyExits do
  @moduledoc """
  Module to demonstrate the codes for the error handling using the exit method
  """

  @doc """
  Function to demonstrate the exit method using try/catch
  
  ## Example
      iex> MyExits.exit_within_try_catch
      “Not Really!”
  """
  def exit_within_try_catch do
    try do
      exit("I am exiting")
    catch
      :exit, _ -> "not really"
    end
  end
end
