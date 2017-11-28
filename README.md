# Elixir Playground

### Pattern Matching and Lists

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
