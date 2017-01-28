defmodule MapAndReduce do

  def sum([]), do: 0
  def sum([h | t]), do: h + sum(t)

  def mul([]), do: 1
  def mul([h | t]), do: h * mul(t)

  def reduce([], _func, acc), do: acc
  def reduce([h | t], func, acc), do: func.(h, reduce(t, func, acc))

  def add_each([]), do: []
  def add_each([h | t]), do: [h + 1 | add_each(t)]

  def string_length([]), do: []
  def string_length([h | t]), do: [String.length(h) | string_length(t)]

  def map([], _f), do: []
  def map([h | t], f), do: [f.(h) | map(t, f)]

end
