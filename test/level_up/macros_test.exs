defmodule LevelUp.MacrosTest do
  use ExUnit.Case
  require LevelUp.Macros

  describe "case_if/1" do
    test "when condition truelly" do
      assert :ok == LevelUp.Macros.case_if(:world == :world, do: :ok, else: :error)
    end

    test "when condition falsey" do
      refute LevelUp.Macros.case_if(:hello == :world, do: true, else: false)
    end
  end

  describe "assert_match/3" do
    test "when match return true" do
      x = {:ok, 1}
      assert true == LevelUp.Macros.assert_match(^x, {:ok, 1}, "expected x to match {:ok, 1}")
    end

    test "when not match return message" do
      assert "{2, 1} not match {1, 1}" ==
               LevelUp.Macros.assert_match({1, 1}, {2, 1}, "{2, 1} not match {1, 1}")
    end
  end
end
