defmodule HitMiss do
  def check(string1, string2) do
    [hit, miss] = do_check(string1, string2, 0, 0, 0)
    (hit |> Integer.to_string) <> "H" <> (miss |> Integer.to_string) <> "M"
  end

  defp do_check("", _string2, hit, miss, _count), do: [hit, miss]
  defp do_check(<<first :: binary-size(1), rest :: binary>>, string2, hit, miss, count) do
    if string2 |> String.contains?(first) do
      if (String.at(string2, count) == first) do
        do_check(rest, string2, hit + 1, miss, count + 1)
      else
        do_check(rest, string2, hit, miss + 1, count + 1)
      end
    else
      do_check(rest, string2, hit, miss, count + 1)
    end
  end
end

IO.inspect HitMiss.check("1808", "1920");
