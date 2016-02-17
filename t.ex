defmodule Play do
  def sum([]), do: 0
  def sum([ head | tail ]), do: head + sum(tail)

  def map([], _func), do: []
  def map([ head | tail ], func) do
    [ func.(head) | map(tail, func) ]
  end
end
