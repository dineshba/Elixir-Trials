defmodule Peak do
  def find([]), do: []
  def find(data), do: _find(data, [])
  
  def _find([a, b, c | rest], acc) when b > a and b > c, do: _find([b, c | rest], [b | acc])
  def _find([a, b, c | rest], acc), do: _find([b, c | rest], acc)
  def _find(_w, acc), do: acc
end

IO.inspect Peak.find([1,2,3,1, 5, 3])
