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

### anonymous functions with pattern matching

``` elixir
account_transaction = fn
    (balance, amount, :deposit) -> balance + amount
    (balance, amount, :withdrawal) -> balance - amount
end

account_transaction.(100, 40, :deposit)     |> IO.puts # 140
account_transaction.(100, 40, :withdrawal)  |> IO.puts # 60
```

### shorthand syntax for anonymous functions
``` elixir
# print_double = fn(number) -> number * 2 end
print_double = &(&1 * 2)

IO.puts print_double.(30)
```

``` elixir
perform_operation = fn
  (values, :addition) -> Enum.reduce(values, &(&1 + &2))
  (values, :multiplication) -> Enum.reduce(values, &(&1 * &2))
end

IO.puts perform_operation.([1, 2, 3, 4], :addition)
IO.puts perform_operation.([1, 2, 3, 4], :multiplication)
```

## Two cases for Recursion

1. The base case, also called *terminating scenario*, where the function does NOT invoke itself.
2. The *recursive case*, where the computation happens and the function invokes itself.

### basic loop

``` elixir
defmodule Language do
    def print_list([head | tail]) do
        IO.puts "item #{head}"
        print_list(tail)
    end

    def print_list([]) do
        IO.puts "end of the loop"
    end
end

Language.print_list(["Elixir", "Javascript", "Ruby"])

#item Elixir
#item Javascript
#item Ruby
#end of the loop
```

## Tuples & Maps

### basic examples

``` elixir
{paradigm, language}  = {:functional, "Elixir"}
IO.puts "Paradigm: #{paradigm}"
IO.puts "Language: #{language}"
# Paradigm: functional
# Language: Elixir

# other example
{ :name, name } = { :name, "Brooke" }
name |> IO.puts
```

### Tuples in Function Signature

``` elixir
defmodule Account do
  def list_transactions( {:ok, content} ) do
    count = length(content)
    IO.puts "Transactions files: #{count}"
  end
  
  def list_transactions( {:error, _} ) do
    IO.puts "Error listing files"
  end
end

File.ls("/home/transactions/") |> Account.list_transactions()

```

## Keyword Lists & Defaults

A keyword list is a list of two-value tuples. They are typically used as the last argument in function signatures, representing options passed to the function.

### basic example

``` elixir
# Keyword list shortcut
Account.balance(..., currency: "dollar", symbol: "$")
# same thing
Account.balance(..., [{ :currency, "dollar" }, { :symbol, "$" }])
```

``` elixir
defmodule Printer do
  def greet(name, options \\ []) do
    greeting = options[:prefix] || "Hello"
    "#{greeting}, #{name}"
  end
end

Printer.greet("Carlos") |> IO.puts
Printer.greet("Sergio", prefix: "O HAI") |> IO.puts
Printer.greet("Dolores", prefix: "Olá") |> IO.puts
```

## Maps

### Matching Portions of a Map

Unlike tuples, with maps we can pattern match only *the portion* we are interested in.

Only reads the value for the name ~key~ on the map, other keys are ignored (only maps support partial match).

``` elixir
person = %{ "name" => "Brooke", "age" => 42 }
%{ "name" => name } = person
IO.puts name
# Brooke
```

#### Tuples don't support partial match!

``` elixir
person = [{:name, "Brooke"}, {:age, 42}]
[{:name, name}] = person
IO.puts name
# ** Match Error
```

### Advanced Pattern Matching with Maps

``` elixir
person = %{ "name" => "Brooke",
            "address" => %{ "city" => "Orlando", "state" => "FL" }}

%{ "address" => %{ "state" => state }} = person

IO.puts "State #{state}"
```

### Rule of Thumb for when to use each data type

#### When to use Keyword Lists?

To pass optional values to functions

``` elixir
Account.balance(..., currency: "dollar", symbol: "$")
```

#### When to use Maps?

To represent a structure as a key-value storage

``` elixir
person = %{ "name" => "Brooke", "age" => 42 }
%{ "name" => name } = person
```
