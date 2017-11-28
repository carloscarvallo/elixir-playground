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

## Anonymous Functions

``` elixir
max_balance = fn(amount) -> "Max #{amount}" end

max_balance.(500)
# Max: 500
```

"Using anonymous functions to decouple logic around performing a task from the logic for the task itself"

``` elixir
deposit = fn(balance, amount) -> balance + amount end
withdrawal = fn(balance, amount) -> balance - amount end

defmodule Account do
    def run_transaction(balance, amount, transaction) do
        if balance <= 0 do
            "Cannot perform any transaction"
        else
            transaction.(balance, amount)
        end
    end
end

1000 |> Account.run_transaction(200, withdrawal) |> IO.puts
1000 |> Account.run_transaction(20, deposit)     |> IO.puts
0    |> Account.run_transaction(20, withdrawal)  |> IO.puts

# 800
# 1020
# Cannot perform any transaction
```