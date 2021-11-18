defmodule MarsExplore do
  @moduledoc """
  Documentation for `MarsExplore`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> MarsExplore.hello()
      :world

  """
  def start do
    {:ok, coordenates} = Elixir.File.read("./inputs.txt")
    [max_area_string | probes_coodenates] = String.split(coordenates, "\n")
    [x_max_string, y_max_string] = String.split(max_area_string, " ")
    x_max = String.to_integer(x_max_string)
    y_max = String.to_integer(y_max_string)
    probes_coodenates_chunk = Enum.chunk_every(probes_coodenates, 2)

    Enum.map(probes_coodenates_chunk, fn [current_position_string, exploration_coordenates_string] ->
      {x_string, y_string, direction} =
        String.split(current_position_string, " ") |> List.to_tuple()

      exploration_coordenates = String.codepoints(exploration_coordenates_string)

      Probe.explore(
        {x_max, y_max},
        {String.to_integer(x_string), String.to_integer(y_string), direction},
        exploration_coordenates
      )
    end)
  end
end
