defmodule RunLengthEncoding do

 def encode([]), do: []
 def encode([h]), do: [{h, 1}]
 def encode([h | t]), do: _encode(h , t, 1)

 defp _encode(h, [h|t], count), do: _encode(h, t, count + 1)
 defp _encode(h, [h1|t], count), do: [{h, count} | encode([h1 | t])]
 defp _encode(h, [], count), do: [{h, count}]

end

ExUnit.start
defmodule RunLengthEncodingTest do
  use ExUnit.Case

  test "test one" do
    assert RunLengthEncoding.encode([]) == []
    assert RunLengthEncoding.encode([1]) == [{1, 1}]
    assert RunLengthEncoding.encode([1, 1]) == [{1, 2}]
  end
end
