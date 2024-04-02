defmodule ConstructTest do
  use ExUnit.Case
  doctest Construct

  test "greets the world" do
    assert Construct.hello() == :world
  end
end
