defmodule Coutarr.Server do
  use GenServer
  alias Coutarr.Service

  # Callbacks

  @impl true
  def init(count) do
    initial_state = %{count: String.to_integer(count)}
    {:ok, initial_state}
  end

  @impl true
  def handle_call(:show, _from, _state) do
    [to_caller | new_state] = Service.show(self())
    {:reply, to_caller, new_state}
  end

  @impl true
  def handle_cast({:inc, from}, _state) do
    new_state = Service.inc(from)
    {:noreply, new_state}
  end

  @impl true
  def handle_cast({:dec, from}, _state) do
    new_state = Service.dec(from)
    {:noreply, new_state}
  end
end
