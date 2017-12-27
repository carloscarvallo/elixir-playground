defmodule Account do
    # first clause
    def run_transaction(balance, amount, :deposit) do
        balance + amount
    end

    def run_transaction(balance, amount, :withdrawal) do
        balance - amount
    end
end

1000 
|> Account.run_transaction(50, :deposit)
|> Account.run_transaction(30, :withdrawal)
|> IO.puts