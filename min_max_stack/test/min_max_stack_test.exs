defmodule MinMaxStackTest do
  use ExUnit.Case

  alias MinMaxStack, as: Stack

  test "returns top properly" do
    push_3_elements()

    assert Stack.top() == 3
  end

  test "pops properly" do
    push_3_elements()

    assert Stack.pop() == 3
    assert Stack.top() == 2
  end

  test "returns max properly" do
    push_3_elements()
    Stack.push(-10)

    assert Stack.max() == 3
  end

  test "returns min properly" do
    push_3_elements()
    Stack.push(-20)
    Stack.push(100)

    assert Stack.min() == -20
  end

  defp push_3_elements() do
    Stack.push(1)
    Stack.push(2)
    Stack.push(3)
  end
end
