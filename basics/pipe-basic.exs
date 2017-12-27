defmodule Account do
    def print_sum do
        1..10
        |> Enum.sum
        |> IO.puts
    end
end

Account.print_sum