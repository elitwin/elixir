defmodule DefParams do
  def func(p1, p2 \\ 2, p3 \\ 3, p4) do
    IO.inspect [p1, p2, p3, p4]
  end

  def func2(p1, p2 \\ 123)

  def func2(p1, p2) when is_list(p1) do
     "You said #{p2} with a list"
  end

  def func2(p1, p2) do
    IO.puts "You passed in #{p1} and #{p2}"
  end
end

DefParams.func("a", "b")
DefParams.func("a", "b", "c")
DefParams.func("a", "b", "c", "d")
