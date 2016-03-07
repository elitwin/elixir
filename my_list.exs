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
  def max([]), do: nil
  def max([head | _tail] = list), do: _max(list, head)

  defp _max([], value), do: value
  defp _max([ head | tail ], value) when head > value, do: _max(tail, head)
  defp _max([ _head | tail ], value), do: _max(tail, value)

  # caesar function
  def caesar([], _n), do: []

  def caesar([ head | tail ], n) when head + n <= ?z do
    IO.puts head + n
    [ head + n | caesar(tail, n) ]
  end

  def caesar([ head | tail ], n) do
    IO.puts head + n - 26
    [ head + n - 26 | caesar(tail, n) ]
  end

  # span
  # def span(from, to), do: Enum.to_list from..to[
  def span(from, to) when from > to, do: []
  def span(from, to), do: [ from | span(from + 1, to) ]

  # all?
  def all?(list),      do: all?(list, fn x -> !!x end)
  def all?([], _func), do: true
  def all?([ head | tail ], func) do
    if func.(head) do
      all?(tail, func)
    else
      false
    end
  end

  # each
  def each([], _func), do: []
  def each([ head | tail ], func) do
    [ func.(head) | each(tail, func) ]
  end

  # filter
  def filter([], _func), do: []
  def filter([ head | tail ], func) do
    if func.(head) do
      [ head | filter(tail, func) ]
    else
      filter(tail, func)
    end
  end

  # split
  def split([head | tail], count) when count > 0 do
    {left, right} = split(tail, count-1)
    {[head | left], right}
  end
  def split(list, _count), do: {[], list}

  # take (with library function)
  # def take(list, n), do: hd(Tuple.to_list(split(list, n)))
  # take without library function
  def take( [ head | tail ], n) when n > 0 do
    [ head | take(tail, n - 1) ]
  end
  def take(_list, _count), do: []

  # flatten
  def flatten(list), do: _flatten(list, [])

  defp _flatten([], tail), do: tail
  defp _flatten([ h | t ], tail) when is_list(h) do
    _flatten(h, _flatten(t, tail))
  end
  defp _flatten([ h | t], tail) do
    [h | _flatten(t, tail)]
  end

  def flatten2([]), do: []
  def flatten2([h|t]) when is_list(h), do: flatten2(h) ++ flatten2(t)
  def flatten2([h|t]), do: [h] ++ flatten2(t)
end
