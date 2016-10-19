defmodule List do
  def reverse(list), do: reverse(list, [])
  defp reverse([], acc), do: acc
  defp reverse([h | rest], acc), do: reverse(rest, [h] ++ acc)
end

IO.inspect List.reverse([1, 2, 3, 4])
