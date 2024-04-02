defmodule Stack do
  use GenServer
  # Callbacks

  @impl true
  def init(count) do
    initial_state = %{ count: String.to_integer(count)}
    {:ok, initial_state}
  end

  @impl true
  def handle_call(:show, from, state) do
    [to_caller | new_state] = Service.show(from)
    {:reply, to_caller, new_state}
  end

  @impl true
  def handle_cast(:inc, state) do
    new_state = Service.increment()
    {:noreply, new_state}
  end

  @impl true
  def handle_cast(:dec, state) do
    new_state = Service.decrement()
    {:noreply, new_state}
  end
