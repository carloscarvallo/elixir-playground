defmodule Accounts do
	def return_investment(initial, spending) do
		initial - spending
	end
end

amount = Accounts.return_investment(1000, 200)
IO.puts "Investment return $#{amount}"
