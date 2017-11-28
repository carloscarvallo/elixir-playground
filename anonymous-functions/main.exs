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