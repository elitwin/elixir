defmodule MyList do
  # generalized map
  def map([], _func),             do: []
  def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]

  # generalized reduce
  def reduce([], value, _), do: value
  def reduce([ head | tail ], value, func) do
    reduce(tail, func.(head, value), func)
  end

  # sum with accumulator
  def sum(list), do: _sum(list, 0)

  defp _sum([], total),              do: total
  defp _sum([ head | tail ], total), do: _sum(tail, head + total)

  # sum without accumulator
  def sum2([]), do: 0
  def sum2([ head | tail ]), do: head + sum2(tail)

  # max function - handles negative values too
  def max([head | _tail] = list), do: _max(list, head)

  defp _max([], value), do: value
  defp _max([ head | tail ], value) when head > value, do: _max(tail, head)
  defp _max([ _head | tail ], value), do: _max(tail, value)

  # caesar function
  def caesar([], _n), do: []

  def caesar([ head | tail ], n) when head+n <= ?z do
    IO.puts head+n
    [ head+n | caesar(tail, n) ]
  end

  def caesar([ head | tail ], n) do
    IO.puts head+n-26
    [ head+n-26 | caesar(tail, n) ]
  end

  # span
  # def span(from, to), do: Enum.to_list from..to[
  def span(from, to) when from > to, do: []
  def span(from, to), do: [ from | span(from + 1, to) ]
end
