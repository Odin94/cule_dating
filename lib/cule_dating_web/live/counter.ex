defmodule CuleDatingWeb.Counter do
  use Phoenix.LiveView

  @topic "live"

  def mount(_params, _session, socket) do
    CuleDatingWeb.Endpoint.subscribe(@topic)

    socket = assign(socket, :val, 0)
    {:ok, socket}
  end

  def handle_event(event = "inc", _, socket) do
    socket = update(socket, :val, &(&1 + 1))

    CuleDatingWeb.Endpoint.broadcast_from(self(), @topic, event, socket.assigns)

    {:noreply, socket}
  end

  def handle_event(event = "dec", _, socket) do
    socket = update(socket, :val, &(&1 - 1))

    CuleDatingWeb.Endpoint.broadcast_from(self(), @topic, event, socket.assigns)

    {:noreply, socket}
  end

  def handle_info(msg, socket) do
    socket = assign(socket, val: msg.payload.val)
    {:noreply, socket}
  end

  def render(assigns) do
    ~L"""
    <div>
      <h1>The count is: <%= @val %></h1>
      <button phx-click="dec">-</button>
      <button phx-click="inc">+</button>
    </div>
    """
  end
end
