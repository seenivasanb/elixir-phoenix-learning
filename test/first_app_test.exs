defmodule FirstAppTest do
  use ExUnit.Case
  doctest FirstApp

  test "greetings" do
    assert FirstApp.hello() == "Hi there!"
  end
end
