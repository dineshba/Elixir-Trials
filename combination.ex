defmodule Combination do
  def combine([]), do: []
  def combine([h|t]) do
    [h] ++ combine(t)
  end
end

IO.inspect Combination.combine([1,2,3])
