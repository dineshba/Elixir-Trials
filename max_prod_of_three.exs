#https://www.interviewcake.com/question/python/highest-product-of-3
defmodule Max_product_from_three do
  def find(list) do
    [a, b, c] = reduce_to_list_to_three_numbers(list, &smallest_number(&1))
    [d, e] = reduce_to_list_to_three_numbers(list, &largest_number(&1))
              |> reduce_one_element(&largest_number(&1))
    largest_number([a * b * c] ++ Enum.map([a, b, c], fn x -> d * e * x end))
  end

  defp reduce_to_list_to_three_numbers([a, b, c], _func), do: [a, b, c]
  defp reduce_to_list_to_three_numbers([a, b, c, d], func), do: reduce_one_element([a, b, c, d], func)
  defp reduce_to_list_to_three_numbers([a, b, c, d | rest], func) do
    reduce_to_list_to_three_numbers(reduce_one_element([a, b, c, d], func) ++ rest, func)
  end

  defp reduce_one_element(list, func) do
    matching_number = func.(list)
    list
    |> Enum.reject(fn x -> x == matching_number end)
  end

  defp smallest_number([]), do: nil
  defp smallest_number([a]), do: a
  defp smallest_number([a, b |rest]) when a > b, do: smallest_number([b | rest])
  defp smallest_number([a, _b |rest]), do: smallest_number([a | rest])

  defp largest_number([]), do: nil
  defp largest_number([a]), do: a
  defp largest_number([a, b |rest]) when a < b, do: largest_number([b | rest])
  defp largest_number([a, _b |rest]), do: largest_number([a | rest])

end

IO.inspect Max_product_from_three.find([4, 1, 3, 2, 5, 5, 6])
