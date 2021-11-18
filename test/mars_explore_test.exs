defmodule MarteExploreTest do
  use ExUnit.Case
  doctest Probe

  test "when coordinates not exceeds the mesh" do
    assert Probe.explore({5, 5}, {1, 2, "N"}, ["L", "M", "L", "M", "L", "M", "L", "M", "M"]) ==
             {1, 3, "N"}
  end

  test "when coordinates exceeds the mesh above max" do
    assert Probe.explore({5, 5}, {3, 3, "E"}, [
             "M",
             "M",
             "R",
             "M",
             "M",
             "R",
             "M",
             "R",
             "R",
             "M",
             "M"
           ]) == "invalide coordinates: exceeded max_field_exploration {6, 1, \"E\"}"
  end

  test "when coordinates exceeds the mesh above min" do
    assert Probe.explore({5, 5}, {3, 3, "W"}, [
             "M",
             "M",
             "M",
             "M"
           ]) == "invalide coordinates: exceeded max_field_exploration {-1, 3, \"W\"}"
  end
end
