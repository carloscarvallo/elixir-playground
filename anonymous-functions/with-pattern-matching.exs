account_transaction = fn
    (balance, amount, :deposit) -> balance + amount
    (balance, amount, :withdrawal) -> balance - amount
end

account_transaction.(100, 40, :deposit)     |> IO.puts
account_transaction.(100, 40, :withdrawal)  |> IO.puts