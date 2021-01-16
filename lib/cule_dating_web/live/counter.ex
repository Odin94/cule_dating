defmodule CuleDatingWeb.Swiper do
  use Phoenix.LiveView

  @topic "live"

  def mount(_params, _session, socket) do
    CuleDatingWeb.Endpoint.subscribe(@topic)

    socket = assign(socket, :indx, 0)
    {:ok, socket}
  end

  def handle_event(event = "next", _, socket) do
    socket = update(socket, :indx, &(&1 + 1))

    CuleDatingWeb.Endpoint.broadcast_from(self(), @topic, event, socket.assigns)

    {:noreply, socket}
  end

  def handle_event(event = "prev", _, socket) do
    socket = update(socket, :indx, &(&1 - 1))

    CuleDatingWeb.Endpoint.broadcast_from(self(), @topic, event, socket.assigns)

    {:noreply, socket}
  end

  def handle_info(msg, socket) do
    socket = assign(socket, indx: msg.payload.indx)
    {:noreply, socket}
  end

  def render(assigns) do
    ~L"""
    <div>
      <h1>The count is: <%= @indx %></h1>
      <button phx-click="prev">PREV</button>
      <button phx-click="next">NEXT</button>
    </div>
    """
  end
end
