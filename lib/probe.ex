defmodule Probe do
  @moduledoc """
    Probe Module defines the actions for each instruction received by the coordinates
    exploration on the mesh and returns to its final position.
  """

  @left -1
  @right 1
  @s 0
  @w 1
  @n 2
  @e 3

  def explore(
        {x_max, y_max} = _max_field_exploration,
        {x, y, direction} = _current_position,
        [head | tail] = _exploration_coordinates
      ) do
    current_direction_by_number = convert_string_coordinate_to_number(direction)

    {new_x, new_y, new_direction} =
      case head do
        "M" ->
          move(current_direction_by_number, x, y)

        _ ->
          rotation_desired_by_number = convert_string_rotation_to_number(head)

          {x, y, update_direction(current_direction_by_number, rotation_desired_by_number)}
      end

    if length(tail) > 0 do
      explore(
        {x_max, y_max},
        {new_x, new_y, convert_number_coordinate_to_string(new_direction)},
        tail
      )
    else
      if new_x > x_max or new_y > y_max or (new_x < 0 or new_y < 0) do
        invalid_position = {new_x, new_y, convert_number_coordinate_to_string(new_direction)}
        "invalide coordinates: exceeded max_field_exploration #{inspect(invalid_position)}"
      else
        {new_x, new_y, convert_number_coordinate_to_string(new_direction)}
      end
    end
  end

  defp move(@e, x, y), do: {x + 1, y, @e}
  defp move(@w, x, y), do: {x - 1, y, @w}
  defp move(@n, x, y), do: {x, y + 1, @n}
  defp move(@s, x, y), do: {x, y - 1, @s}

  defp update_direction(0, -1), do: 3
  defp update_direction(3, 1), do: 0

  defp update_direction(current_direction, rotation_desired),
    do: current_direction + rotation_desired

  defp convert_string_rotation_to_number("R"), do: @right
  defp convert_string_rotation_to_number("L"), do: @left

  defp convert_string_coordinate_to_number("S"), do: @s
  defp convert_string_coordinate_to_number("W"), do: @w
  defp convert_string_coordinate_to_number("N"), do: @n
  defp convert_string_coordinate_to_number("E"), do: @e

  defp convert_number_coordinate_to_string(0), do: "S"
  defp convert_number_coordinate_to_string(1), do: "W"
  defp convert_number_coordinate_to_string(2), do: "N"
  defp convert_number_coordinate_to_string(3), do: "E"
end
