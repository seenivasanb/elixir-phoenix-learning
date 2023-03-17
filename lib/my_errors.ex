defmodule MyErrors do
  @moduledoc """
  Module to demostrate the codes for error handling in the Elixir using Try, Catch and Rescue
  """

  @doc """
  This is an example of Arithmentic Error
  
  ## Example
      iex> MyErrors.arithmetic_error
      ** (ArithmeticError) bad argument in arithmetic expression: :hi + 1
        :erlang.+(:hi, 1)
  """
  def arithmetic_error do
    :hi + 1
  end

  @doc """
  This is an example for raising the manuall error my `raise/1` function
  
  ## Example
      iex> MyErrors.error_by_raise
      ** (RuntimeError) Oops
  """
  def error_by_raise do
    raise "Oops"
  end

  @doc """
  This is an example for raising the manuall error my `raise/1` function
  
  ## Example
      iex> MyErrors.error_by_raise_2
      ** (ArgumentError) Invalid Argument!
  """
  def error_by_raise_2 do
    raise(ArgumentError, message: "Invalid Argument!")
  end

  @doc """
  This is an example for raising the manuall error my `raise/1` function
  
  ## Example
      iex> MyErrors.try_and_rescue
      %RuntimeError{message: "Oops!"}
  """
  def try_and_rescue do
    try do
      raise "Oops!"
    rescue
      _e in RuntimeError -> "hi"
    end
  end

  @doc """
  This is an example for file reading operartion using case statements
  
  ## Example
      iex> MyErrors.get_data_from_file("myFile1")
      {:error, :enoent}
      iex> File.write("myFile1", "myContent")
      :ok
      iex> MyErrors.get_data_from_file("myFile1")
      {:ok, "myContent"}
  """
  def get_data_from_file(filename) do
    case File.read(filename) do
      {:ok, body} -> IO.puts("Success: #{body}")
      {:error, _reason} -> "File does not exists"
    end
  end

  @doc """
  This is an example of reraise construct
  
  ## Example
      iex> MyErrors.example_of_reraise
      Log Custom Error!
      ** (RuntimeError) Oops!
  """
  def example_of_reraise do
    try do
      raise "Oops!"
    rescue
      e ->
        IO.puts("Log Custom Error!")
        reraise(e, __STACKTRACE__)
    end
  end

  @doc """
  Function to demonstrate the code for defexception in error handling
  ## Example
      iex> MyErrors.sample_defexception
      ** (MyErrors) Custom Error By defexception!
  """
  defexception [:message]

  def sample_defexception do
    raise MyErrors, message: "Custom Error By defexception!"
  end
end
