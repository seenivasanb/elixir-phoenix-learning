defmodule MyDebug do
  @moduledoc """
  Module to demonstrate the code for debugging in the Elixir
  """

  @doc """
  Function to demonstrate the IEx tool
  
  ## Example
      iex> MyDebug.sample_IEx([2, 3])
      warning: variable "b" is unused (if the variable is not meant to be used, prefix it with an underscore)
      2
  """
  def sample_IEx([a, b]) do
    b = 0
    a + b
  end

  @doc """
  Function to demonstrate the IEx.pry debugger
  
  ## Example
      iex> MyDebug.sample_iex_pry([2, 3])
      Break reached: MyDebug.sample_iex_pry/1 (lib/my_debug.ex:44)
  
        41:   def sample_iex_pry([a, b]) do
        42:     b = 0
        43:     require IEx
        44:     IEx.pry()
        45:     a + b
        46:   end
        47: end
  
      pry(1)> a
      2
      pry(2)> b
      0
      pry(3)> a + b
      2
      pry(4)> continue
      2
  
      Interactive Elixir (1.14.3) - press Ctrl+C to exit (type h() ENTER for help)
      iex>
  """
  def sample_iex_pry([a, b]) do
    b = 0
    require IEx
    IEx.pry()
    a + b
  end

  def sample_debugger(a, b, c) do
    x = a * 2
    y = b * 3
    z = c * 5

    x + y + z
  end
end
