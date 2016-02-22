defmodule Chop do

  def guess(actual, range) do
    _guess(actual, range)
  end

  defp _guess(actual, l..h) when actual < l or actual > h do
    IO.puts "Actual value must be between #{l} and #{h}"
  end

  defp _guess(actual, l..h) when actual == div(l + h, 2) do
   IO.puts "Is it #{actual}?"
    actual
  end

  defp _guess(actual, l..h) when actual < div(l + h, 2) do
   IO.puts "Is it #{div(l + h,2)}?"
    _guess(actual, l..(div(l + h, 2) - 1))
  end

  defp _guess(actual, l..h) when actual > div(l + h, 2) do
   IO.puts "Is it #{div(l + h,2)}?"
    _guess(actual, (div(l + h, 2) + 1)..h)
  end
end
