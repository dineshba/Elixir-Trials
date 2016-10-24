Code.load_file("mars_rover.ex")

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule MarsRoverSpec do
  use ExUnit.Case

  test "show accept co-ordinates and empty instructions" do
    result = MarsRover.execute([5, 5], [])
    assert result == :ok
  end

  test "move" do
    result = MarsRover.move("00N", "N")
    assert result == "01N"
    result = MarsRover.move("00E", "E")
    assert result == "10E"
    result = MarsRover.move("11W", "W")
    assert result == "01W"
    result = MarsRover.move("11S", "S")
    assert result == "10S"
  end

  test "rotate left" do
    result = MarsRover.rotate_left("00", "N")
    assert result == "00W"
    result = MarsRover.rotate_left("00", "E")
    assert result == "00N"
    result = MarsRover.rotate_left("00", "W")
    assert result == "00S"
    result = MarsRover.rotate_left("00", "S")
    assert result == "00E"
  end

  test "rotate right" do
    result = MarsRover.rotate_right("00", "N")
    assert result == "00E"
    result = MarsRover.rotate_right("00", "E")
    assert result == "00S"
    result = MarsRover.rotate_right("00", "W")
    assert result == "00N"
    result = MarsRover.rotate_right("00", "S")
    assert result == "00W"
  end

  test "find_new_position" do
    result = MarsRover.find_new_position("00N", "M")
    assert result == "01N"
    result = MarsRover.find_new_position("32S", "L")
    assert result == "32E"
    result = MarsRover.find_new_position("31E", "R")
    assert result == "31S"
  end

  test "show accept co-ordinates and one simple instructions" do
    result = MarsRover.execute([5, 5], ["12N", "LMLMLMLMM"])
    assert result == "13N"
    result = MarsRover.execute([5, 5], ["33E", "MMRMMRMRRM"])
    assert result == "51E"
  end

end
