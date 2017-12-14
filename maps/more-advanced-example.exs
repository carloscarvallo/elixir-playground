person = %{ "name" => "Brooke",
            "address" => %{ "city" => "Orlando", "state" => "FL" }}

%{ "address" => %{ "state" => state }} = person

IO.puts "State #{state}"