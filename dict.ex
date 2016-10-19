defmodule Dictionary do
  defp find_next(string, length) do
    if is_swapable(string, length) do
      String.slice(string, 0, length - 2) <> String.at(string, length - 1) <> String.at(string, length - 2)
    else

    end
  end

  def next(string), do: find_next(string, String.length(string))

  end

  defp is_swapable(input, length) do
    String.at(input, length - 1) > String.at(input, length - 2)
  end
end

IO.inspect Dictionary.next("abcdb")
