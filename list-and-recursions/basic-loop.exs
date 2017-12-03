defmodule Language do
    def print_list([head | tail]) do
        IO.puts "item #{head}"
        print_list(tail)
    end

    def print_list([]) do
    end
end

Language.print_list(["Elixir", "Javascript", "Ruby"])