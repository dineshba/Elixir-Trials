defmodule Anagram do
  def check(string1, string2) do
    do_check(string1, string2, String.length(string1) == String.length(string2))
  end

  defp do_check("", _anything, valid?), do: valid?

  defp do_check(_anything, _anyotherthing, false), do: false

  defp do_check(<<first_character::binary-size(1), rest::binary>>, string2, true) do
    do_check(rest, string2, String.contains?(string2, first_character))
  end
end

IO.inspect Anagram.check("abcd", "cbda")
