defmodule LevelUpTest do
  use ExUnit.Case
  doctest LevelUp

  test "greets the world" do
    assert LevelUp.hello() == :world
  end

  test "contact emil" do
    assert LevelUp.contact_email() == "test@elixirschool.com"
  end
end
