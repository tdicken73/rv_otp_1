defmodule Counter do
  use GenServer

  # Client API

  def start_link do
    GenServer.start_link(__MODULE__, 0, name: :counter)
  end

  def increment do
    GenServer.call(:counter, :increment)
  end

  def get_value do
    GenServer.call(:counter, :get_value)
  end

  # Server callbacks

  def init(value) do
    {:ok, value}
  end

  def handle_call(:increment, _from, state) do
    {:reply, :ok, state + 1}
  end

  def handle_call(:get_value, _from, state) do
    {:reply, state, state}
  end
end