defmodule MyString do
  def printable_ascii(sqs), do: Enum.all?(sqs, &(&1 >= ?\s and &1 <= ?~))
  #def printable_ascii(sqs), do: Enum.all?(sqs, fn ch -> ch in ?\s..?~ end)


  # Maybe lowercase everything first to ignore case - specs unclear
  def anagram(sqs1, sqs2), do: Enum.sort(sqs1) == Enum.sort(sqs2)

  def center(dqs) do
    max_len = Enum.max_by(dqs, &String.length/1) |> String.length

    dqs |> Enum.each(&(center_print &1, max_len))
  end

  def center_print(dq, max_len) do
    String.rjust(dq, div(max_len + String.length(dq), 2)) |> IO.puts
  end

  def capitalize_sentences(string) do
    string
    |> String.split(~r{\.\s+})
    |> Enum.map(&String.capitalize/1)
#    |> Enum.map(fn(x) -> String.capitalize(x) end)
    |> Enum.join(". ")
  end

  def number([ ?- | tail ]), do: _number_digits(tail, 0) * -1
  def number([ ?+ | tail ]), do: _number_digits(tail, 0)
  def number(str),           do: _number_digits(str, 0)

  defp _number_digits([], value), do: value
  defp _number_digits([ digit | tail ], value)
  when digit in '0123456789' do
    _number_digits(tail, value * 10 + digit - ?0)
  end
  defp _number_digits([ non_digit | _ ], _) do
    raise "Invalid digit '#{[non_digit]}'"
  end
end
