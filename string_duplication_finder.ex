defmodule StringDuplicationFinder do
  def find(input) do
    case do_find(input, true) do
      {_, false} -> "Duplicated string with" <> _
      _ -> "No Duplication"
  end

  def do_find(_, false), do: {_, false}
  def do_find("", valid?), do: {"", valid?}
  def do_find(<<first_character::binary-size(1), rest::binary>>, true) do
    _find(rest, !String.contains?(rest, first_character))
  end
end

IO.inspect StringDuplicationFinder.find("abca")
