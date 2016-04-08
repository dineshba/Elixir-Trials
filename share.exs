defmodule Share do
  def calculate(a), do: "Aswin mada a profit of " <> abc(String.split(a, ~r{,}))

  defp abc([], amount), do: Integer.to_string(amount)

  defp abc([h| t], amount \\ 0) do
    IO.inspect h
    amount = find(amount, h)
    abc(t, amount)
  end

  def find(amount, h) do
    a = String.split(h, ~r{ })
    IO.inspect a
    IO.inspect Enum.at(a, 1)
    if Enum.at(a, 1) == "buys" do
      IO.inspect amount
      IO.inspect Enum.at(a, 2)
      IO.inspect Enum.at(a, 7)
      {val1, _} = Integer.parse Enum.at(a,2)
      {val2, _} = Integer.parse Enum.at(a,7)
      amount = amount + (val1 * val2)
     end
    if Enum.at(a, 1) == "sells" do
      amount = amount - (Enum.at(a, 2) * Enum.at(a, 7))
    end
    IO.inspect amount
    amount
  end
end
