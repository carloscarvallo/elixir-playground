# this can be done with maps
person = %{ "name" => "Brooke", "age" => 42 }
%{ "name" => name } = person
IO.puts name

# it will not work
person = [{ :name, "Brooke" }, { :age, 42 }]
[{:name, name}] = person
IO.puts name

# working example
person = [{ :name, "Brooke" }, { :age, 42 }]
[{:name, name}, {:age, age}] = person
IO.puts "name #{name}, age #{age}"