defmodule ShareCalculator do
  def calculate(inputString), do: "Aswin made a profit of " <> _calculate(String.split(inputString, ~r{,}), 0)

  defp _calculate([], amount), do: Float.to_string(amount, [decimals: 2])

  defp _calculate([h|t], amount), do: _calculate(t, parseAndCalculateEachSentence(h, amount))

  defp parseAndCalculateEachSentence(head, amount) do
    sentence_array = String.split(head, ~r{ })
    {val1, _} = Float.parse Enum.at(sentence_array,2)
    {val2, _} = Float.parse Enum.at(sentence_array,7)
    if Enum.at(sentence_array, 1) == "buys" do
      amount + (val1 * val2)
    else
      amount - (val1 * val2)
    end
  end
end
