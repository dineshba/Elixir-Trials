defmodule ShareCalculator do
  def calculate(inputString), do: "Aswin made a profit of " <> _calculate(String.split(inputString, ~r{,}), 0)

  defp _calculate([], amount, _total_share), do: Float.to_string(amount, [decimals: 2])

  defp _calculate([h|t], amount, total_share \\ 0), do: _calculate(t, parseAndCalculateEachSentence(h, amount))

  defp parseAndCalculateEachSentence(head, amount) do
    IO.inspect head
    IO.inspect String.split(head, ~r{ })
    sentence_array = String.split(head, ~r{ })
    unless Enum.at(sentence_array, 3) == "all" do
      IO.inspect Float.parse Enum.at(sentence_array,2)
      IO.inspect Float.parse Enum.at(sentence_array,7)
      {val1, _} = Float.parse Enum.at(sentence_array,2)
      {val2, _} = Float.parse Enum.at(sentence_array,7)
      if Enum.at(sentence_array, 1) == "buys" do
        amount + (val1 * val2)
      else
        amount - (val1 * val2)
      end
    else

    end
  end
end

ShareCalculator.calculate "Aswin buys 100 shares of HUL @ 55.75 a share,Aswin sells 20 shares of HUL @ 58 a share"
