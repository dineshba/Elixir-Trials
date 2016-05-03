defmodule Palindrome do
  def number_of_min_chars_to_be_added(string), do: number_of_min_chars_to_be_added(string, String.reverse(string), 0)

  defp number_of_min_chars_to_be_added(string, string, count), do: count

  defp number_of_min_chars_to_be_added(string, _string2, count) do
    { first, last } = String.split_at(string, String.length(string) - count)
    temp_string = first <> String.at(string, count) <> last
    number_of_min_chars_to_be_added(temp_string, String.reverse(temp_string), count + 1)
  end
end

IO.inspect Palindrome.number_of_min_chars_to_be_added("malal")
