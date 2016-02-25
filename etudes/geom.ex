defmodule Geom do
  @moduledoc """
  Functions for calculating areas of geometric shapes.

  from *Etudes for Elixir*
  """
  @vsn 0.2

  @doc """
  Calculates the area of a shape, given the shape and two of the
  dimensions. Returns the product of its arguments for a rectangle,
  one half the product of the arguments for a triangle, and
  :math.pi times the product of the arguments for an ellipse.
  Accepts only dimensions that are non-negative.
  """

  @spec area({atom, number, number}) :: number
  def area({shape, dim1, dim2}) do
    area(shape, dim1, dim2)
  end

  @spec area(atom, number, number) :: number
  defp area(:rectangle, l, w) when l > 0 and w > 0 do
    l * w
  end

  defp area(:triangle, b, h) when b > 0 and h > 0 do
    (b * h) / 2.0
  end

  defp area(:ellipse, a, b) when a > 0 and b > 0 do
    :math.pi() * a * b
  end

  defp area(_shape, _, _) do
    0
  end
end
