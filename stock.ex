defmodule Stock do
  def get_max_profit([first, second | _rest] = stock_prices_yesterday) do
      compare_and_find_better_pair(stock_prices_yesterday, second - first)
  end

  defp compare_and_find_better_pair([_first | []], max_diff), do: max_diff
  defp compare_and_find_better_pair([first | rest], max_diff) do
    if (temp = find_max(rest) - first) > max_diff, do: max_diff = temp
    compare_and_find_better_pair(rest, max_diff)
  end

  def find_max([]), do: nil
  def find_max([h | []]), do: h
  def find_max([h1 , h2 | t]) when h1 <= h2, do: find_max([h2|t])
  def find_max([h1 , _h2 | t]), do: find_max([h1|t])

end

IO.inspect Stock.get_max_profit([10,5,2])
