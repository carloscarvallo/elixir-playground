# Elixir Playground

## Basic Types

### Atoms

```
:hello
```

"...similar to strings but more memory efficient", more at:

https://elixir-lang.org/getting-started/basic-types.html#atoms

## Pattern Matching and Lists

``` elixir
data = ["Elixir", "Valim"]
IO.puts data
# ElixirValim
```
``` elixir
# using string interpolation
[lang, author] = data
IO.puts "#{lang}, #{author}"
# Elixir, Valim
```
### Replacing if Statements with Pattern Matching

``` elixir
defmodule Account do
    def run_transaction(balance, amount, :deposit) do
        balance + amount
    end

    def run_transaction(balance, amount, :withdrawal) do
        balance - amount
    end
end

Account.run_transaction(1000, 50, :deposit) |> IO.puts # 1050
Account.run_transaction(1050, 30, :withdrawal) |> IO.puts # 1020
```

### Pattern Matching and the Pipe Operator

``` elixir
1000 |> Account.run_transaction(50, :deposit)    |> IO.puts # 1050
1050 |> Account.run_transaction(30, :withdrawal) |> IO.puts # 1020
```