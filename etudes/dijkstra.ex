defmodule Dijkstra do
  @moduledoc """
  Recursive function for calculating GCD of two numbers using
  Dijkstra's algorithm.
  from *Études for Elixir*
  """
  @vsn 0.1

  @doc """
  Calculates the greatest common divisor of two integers.
  Uses Dijkstra's algorithm, which does not require any division.
  """
  @spec gcd(number, number) :: number
  def gcd(m, n) when m == n, do: m
  def gcd(m, n) when m > n , do: gcd(m - n, n)
  def gcd(m, n)            , do: gcd(m, n - m)


  @doc """
  Calculates the greatest common divisor of two integers.
  Uses Dijkstra's algorithm, which does not require any division.
  This method uses a 'cond' instead of guards
  """
  @spec gcd1(number, number) :: number
  def gcd1(m, n) do
    cond do
      m == n -> m
      m > n  -> gcd1(m - n, n)
      true   -> gcd1(m, n - m)
    end
  end
end
