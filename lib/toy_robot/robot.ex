defmodule ToyRobot.Robot do
  defstruct north: 0, east: 0, facing: :north
  alias ToyRobot.Robot

  @doc """
  Moves the robot forward one space in the direction it is facing

  ## Examples

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %Robot{north: 0, facing: :north}
    %Robot{north: 0, facing: :north}
    iex> robot |> Robot.move
    %Robot{north: 1}
  """

  def move(%Robot{facing: facing} = robot) do
    case facing do
      :east -> robot |> move_east
      :west -> robot |> move_west
      :north -> robot |> move_north
      :south -> robot |> move_south
    end
  end

  @doc """
  Turn the robot left.

  ## Examples

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %Robot{facing: :north}
    %Robot{facing: :north}
    iex> robot |> Robot.turn_left
    %Robot{facing: :west}
  """
  def turn_left(%Robot{facing: facing}) do
    case facing do
      :north -> %Robot{facing: :west}
      :east -> %Robot{facing: :north}
      :south -> %Robot{facing: :east}
      :west -> %Robot{facing: :south}
    end
  end

  @doc """
  Turn the robot right.

  ## Examples

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %Robot{facing: :north}
    %Robot{facing: :north}
    iex> robot |> Robot.turn_right
    %Robot{facing: :east}
  """
  def turn_right(%Robot{facing: facing}) do
    case facing do
      :north -> %Robot{facing: :east}
      :east -> %Robot{facing: :south}
      :south -> %Robot{facing: :west}
      :west -> %Robot{facing: :north}
    end
  end

  defp move_east(robot) do
    %Robot{east: robot.east + 1}
  end

  defp move_west(robot) do
    %Robot{east: robot.east - 1}
  end

  defp move_north(%Robot{} = robot) do
    %Robot{north: robot.north + 1}
  end

  defp move_south(robot) do
    %Robot{north: robot.north - 1}
  end
end
