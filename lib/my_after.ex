defmodule MyAfter do
  @moduledoc """
  Module to demonstrate the code for the error handling using the try/after construct
  """

  @doc """
  Function to close the file even if something goes wrong in read or write funtion
  
  ## Example
      iex> MyAfter.try_after_for_file_close
      ** (RuntimeError) Oops, something went wrong
  """
  def try_after_for_file_close do
    {:ok, file} = File.open("myFile1", [:utf8, :write])

    try do
      IO.write(file, "ola")
      raise "Oops, something went wrong!"
    after
      File.close(file)
      IO.puts("File is closed!")
    end
  end

  @doc """
  Function to demonstrate the after construct on function declaration without try
  
  ## Example
      iex(1)> MyAfter.without_try_with_after
      Cleaning up!
      ** (RuntimeError) Oops!
  """
  def without_try_with_after do
    raise "Oops!"
  after
    IO.puts("Cleaning Up!")
  end

  @doc """
  Function to demonstrate the error handling using Else construct
  
  ## Example
      iex> MyAfter.sample_else(2)
      :small
      iex> MyAfter.sample_else(1)
      :large
      iex> MyAfter.sample_else(0)
      :infinity
  """
  def sample_else(n) do
    try do
      1 / n
    rescue
      ArithmeticError -> :infinity
    else
      m when m < 1 and m > -1 ->
        :small

      _ ->
        :large
    end
  end
end
