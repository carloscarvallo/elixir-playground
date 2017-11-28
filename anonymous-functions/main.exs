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

Account.run_transaction(1000, 200, withdrawal) |> IO.puts
Account.run_transaction(1000, 20, deposit) |> IO.puts
Account.run_transaction(0, 20, withdrawal) |> IO.puts