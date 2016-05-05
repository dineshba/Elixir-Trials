#https://www.interviewcake.com/question/python/highest-product-of-3
defmodule Max_product_from_three do
  def find(list) do
    [a, b, c] = reduce_to_list_of_three_large_numbers(list)
    a * b * c
  end

  defp reduce_to_list_of_three_large_numbers([a, b, c]), do: [a, b, c]
  defp reduce_to_list_of_three_large_numbers([a, b, c, d]), do: find_max_three_from_four([a, b, c, d])
  defp reduce_to_list_of_three_large_numbers([a, b, c, d | rest]) do
    reduce_to_list_of_three_large_numbers(find_max_three_from_four([a, b, c, d]) ++ rest)
  end

  defp find_max_three_from_four(list) do
    smallest_number = smallest_number(list)
    list
    |> Enum.reject(fn x -> x == smallest_number end)
  end

  defp smallest_number([]), do: nil
  defp smallest_number([a]), do: a
  defp smallest_number([a, b |rest]) when a > b, do: smallest_number([b | rest])
  defp smallest_number([a, _b |rest]), do: smallest_number([a | rest])
end

IO.inspect Max_product_from_three.find([4, 1, 3, 2, 5, 5, 6])
