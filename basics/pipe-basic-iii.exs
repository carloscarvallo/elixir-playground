defmodule Person do
  def format_name(full_name) do
    full_name |> String.split |> format
  end

  def format(parts) do
    # IO.puts parts
    first = Enum.at(parts, 0)
    last = Enum.at(parts, 1)
    "#{String.upcase(last)}, #{first}"
  end
end 

# IO.puts Person.format_name("Carlos Carvallo")
"Carlos Carvallo" |> Person.format_name |> IO.puts