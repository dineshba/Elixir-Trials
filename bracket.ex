defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """

  @openers ["[", "{", "("]
  @closers ["]", "}", ")"]

  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str |> String.split("") |> do_check_brackets
  end

  def do_check_brackets(list) do
    do_check_brackets(list, [])
  end

  def do_check_brackets([""], []) do
    true
  end

  def do_check_brackets([char|tail], openers) when char in @openers do
    do_check_brackets(tail, [char|openers])
  end

  def do_check_brackets([a|tail_a], [b|tail_b]) when a == Map.take(%{'[': ']'}) do
    do_check_brackets(tail_a, tail_b)
  end
  #
  # def do_check_brackets(["}"|tail_a], ["{"|tail_b]) do
  #   do_check_brackets(tail_a, tail_b)
  # end
  #
  # def do_check_brackets([")"|tail_a], ["("|tail_b]) do
  #   do_check_brackets(tail_a, tail_b)
  # end

  def do_check_brackets([char|_], _openers) when char in @closers do
    false
  end

  def do_check_brackets([_|tail], openers) do
    do_check_brackets(tail, openers)
  end

  def do_check_brackets(_, _) do
    false
  end
end
