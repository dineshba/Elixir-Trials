defmodule FizzBuzz do
  def upto(n), do: fizzbuzz([], n)
  defp fizzbuzz(result, 0), do: result
  defp fizzbuzz(result, x) when rem(x, 15) == 0 , do: fizzbuzz(["fizzbuzz"|result], x - 1)
  defp fizzbuzz(result, x) when rem(x, 5) == 0 , do: fizzbuzz(["buzz"|result], x - 1)
  defp fizzbuzz(result, x) when rem(x, 3) == 0 , do: fizzbuzz(["fizz"|result], x - 1)
  defp fizzbuzz(result, x), do: fizzbuzz([x|result], x - 1)
end

IO.inspect FizzBuzz.upto(20)
