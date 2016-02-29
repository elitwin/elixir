defmodule Powers do
  @moduledoc """
  Non-Tail recursive function for raising a number to an integer power.
  from *Études for Elixir*
  """
  @vsn 0.1

  import Kernel, except: [raise: 2]

  @doc """
  Raise a number x to an integer power n.
  Any number to the power 0 equals 1.
  Any number to the power 1 is that number itself.
  When n is positive, x^n is equal to x times x^(n - 1)
  When n is negative, x^n is equal to 1.0 / x^n
  """

  @spec raise(number, number) :: number
  def raise(_, 0), do: 1
  def raise(x, 1), do: x
  def raise(x, n) when n > 0, do: x * raise(x, n - 1)
  def raise(x, n) when n < 0, do: 1.0 / raise(x, -n)
end
