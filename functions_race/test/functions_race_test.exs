defmodule FunctionsRaceTest do
  use ExUnit.Case

  test "when first is the fastest" do
    functions = [
      build_function(100, :first),
      build_function(200, :second),
      build_function(300, :third)
    ]

    assert FunctionsRace.run(functions) == :first
  end

  test "when second is the fastest" do
    functions = [
      build_function(10_000, :first),
      build_function(100, :second),
      build_function(20_000, :third)
    ]

    task = Task.async(fn -> FunctionsRace.run(functions) end)
    assert Task.await(task, 200) == :second
  end

  defp build_function(delay, result) do
    fn ->
      :timer.sleep(delay)
      result
    end
  end
end
