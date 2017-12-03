defmodule Language do
    def print_list([head | tail]) do
        IO.puts "Head: #{head}"
        IO.puts "Tail: #{tail}"
    end
end

Language.print_list(["Elixir", "Javascript", "Ruby"])

# [head | tail] = languages