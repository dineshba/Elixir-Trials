#https://www.interviewcake.com/question/python/highest-product-of-3
defmodule Max_product_from_three do
  def find(list) do
    [a, b, c] = reduce_to_list_to_three_numbers(list, &smallest_number(&1)) #largest_three_number
    [d, e] = reduce_to_list_to_three_numbers(list, &largest_number(&1)) #smallest_three_number
              |> reduce_by_one_element(&largest_number(&1))
    largest_number([a * b * c, e * d * largest_number([a, b, c])])
  end

  defp reduce_to_list_to_three_numbers([a, b, c], _func), do: [a, b, c]
  defp reduce_to_list_to_three_numbers([a, b, c, d], func), do: reduce_by_one_element([a, b, c, d], func)
  defp reduce_to_list_to_three_numbers([a, b, c, d | rest], func) do
    reduce_to_list_to_three_numbers(reduce_by_one_element([a, b, c, d], func) ++ rest, func)
  end

  defp reduce_by_one_element(list, func) do
    matching_number = func.(list)
    list
    |> remove(matching_number, [])
  end

  defp remove([h | rest], matching_number, new_list) when h == matching_number, do: new_list ++ rest
  defp remove([h | list], matching_number, new_list), do: remove(list, matching_number, new_list ++ [h])

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
