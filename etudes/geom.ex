defmodule Geom do
  @moduledoc """
  Functions for calculating areas of geometric shapes.

  from *Etudes for Elixir*
  """
  @vsn 0.1

  @doc """
  Calculates the area of a rectangle, given the length and width.
  Returns the product of its arguments. The default value for
  both arguments is 1.
  """

  @spec area(number, number) :: number
  def area(w \\ 1, h \\ 1) do
    w * h
  end
end
