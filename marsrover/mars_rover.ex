defmodule MarsRover do

  def execute([x, y], []), do: :ok
  def execute([x, y], [one_rover_and_its_instructions | rest]) do
     IO.inspect execute_for(one_rover_and_its_instructions, [x, y])
     execute([x, y], rest)
  end

  def execute_for([initial_position, instructions], [x, y]), do: start_finding_new_position(initial_position, instructions)

  def start_finding_new_position(current_position, ""), do: current_position
  def start_finding_new_position(current_position, <<one_instruction::binary-size(1), rest::binary>>) do
    find_new_position(current_position, one_instruction) |> start_finding_new_position(rest)
  end

  def find_new_position(<<position::binary-size(2), direction::binary-size(1)>>, "L"), do: rotate_left(position, direction)
  def find_new_position(<<position::binary-size(2), direction::binary-size(1)>>, "R"), do: rotate_right(position, direction)
  def find_new_position(<<position::binary-size(2), direction::binary-size(1)>> = current_position, "M"),
          do: move(current_position, direction)

  def rotate_left(position, "N"), do: position <> "W"
  def rotate_left(position, "E"), do: position <> "N"
  def rotate_left(position, "W"), do: position <> "S"
  def rotate_left(position, "S"), do: position <> "E"

  def rotate_right(position, "N"), do: position <> "E"
  def rotate_right(position, "E"), do: position <> "S"
  def rotate_right(position, "W"), do: position <> "N"
  def rotate_right(position, "S"), do: position <> "W"

  def move(<<x_position::binary-size(1), y_position::binary-size(1), direction::binary-size(1)>>, "N"), do: x_position <> inc(y_position) <> direction
  def move(<<x_position::binary-size(1), y_position::binary-size(1), direction::binary-size(1)>>, "E"), do: inc(x_position) <> y_position <> direction
  def move(<<x_position::binary-size(1), y_position::binary-size(1), direction::binary-size(1)>>, "W"), do: dec(x_position) <> y_position <> direction
  def move(<<x_position::binary-size(1), y_position::binary-size(1), direction::binary-size(1)>>, "S"), do: x_position <> dec(y_position) <> direction

  defp inc(number), do: Integer.to_string(String.to_integer(number) + 1)
  defp dec(number), do: Integer.to_string(String.to_integer(number) - 1)

end

MarsRover.execute([5,5], [["12N", "LMLMLMLMM"], ["33E", "MMRMMRMRRM"]])
