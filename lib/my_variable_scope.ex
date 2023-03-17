defmodule MyVariableScope do
  @moduledoc """
  Module to demonstrate the code for the variable scope
  """

  @doc """
  Function to demonstrate the invalid variable access in the try/catch/rescue/after construct
  
  ## Example
      iex> MyVariableScope.assign_value_from_try_expression
      "Rescue Block"
  """
  def assign_value_from_try_expression do
    outter_variable =
      try do
        raise "Oops!"
        "Try Block"
      rescue
        _ -> "Rescue Block"
      end

    outter_variable
  end
end
