#https://www.interviewcake.com/question/ruby/stock-price
defmodule Stock do
  def get_max_profit([first, second | rest]) do
      compare_and_find_better_pair([second | rest], first, second - first)
  end

  defp compare_and_find_better_pair([], _min_price, max_diff), do: max_diff
  defp compare_and_find_better_pair([first | rest], min_price, max_profit) do
    potential_profit = first - min_price
    if potential_profit > max_profit, do: max_profit = potential_profit
    if min_price > first, do: min_price = first
    compare_and_find_better_pair(rest, min_price, max_profit)
  end
end

IO.inspect Stock.get_max_profit([10,5,2])
