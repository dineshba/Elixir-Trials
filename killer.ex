defmodule KillerProgram do
  def kill([], _anything), do: []
  def kill([h|t], _anything) when t == [], do: h
  def kill(list, head) do
    new_head = rem((head + 1), Enum.count(list))
    kill(Enum.reject(list, &(&1 == Enum.at(list, new_head))), new_head)
  end
end

IO.inspect(KillerProgram.kill ["a", "b", "c", "d"], 0)
