defmodule Expenses do
  @moduledoc """
  Documentation for Expenses.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Expenses.hello
      :world

  """
  def hello do
    :world
  end

  def current_balance(initial, spending) do
    initial - spending
  end
en