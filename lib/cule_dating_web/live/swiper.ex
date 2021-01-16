defmodule CuleDatingWeb.Swiper do
  use Phoenix.LiveView
  require Logger

  @topic "live"
  @unsplash_url "https://images.unsplash.com"
  @images [
    "photo-1554151228-14d9def656e4",
    "photo-1499996860823-5214fcc65f8f",
    "photo-1509967419530-da38b4704bc6",
    "photo-1542909168-82c3e7fdca5c",
    "photo-1554384645-13eab165c24b"
  ]

  def mount(_params, _session, socket) do
    CuleDatingWeb.Endpoint.subscribe(@topic)

    socket = assign(socket, :image_id, 0)
    {:ok, socket}
  end

  def handle_event(event = "next", _, socket) do
    socket = update(socket, :image_id, &(&1 + 1))

    {:noreply, socket}
  end

  def handle_event(event = "prev", _, socket) do
    socket = update(socket, :image_id, &(&1 - 1))

    {:noreply, socket}
  end

  def handle_info(msg, socket) do
    socket = assign(socket, image_id: msg.payload.image_id)
    {:noreply, socket}
  end

  def image(image_id, params) do
    uri =
      URI.parse(@unsplash_url)
      |> URI.merge(Enum.at(@images, image_id))
      |> Map.put(:query, URI.encode_query(params))
      |> URI.to_string()

    Logger.info(uri)

    uri
  end

  def thumbnail(image_id), do: image(image_id, %{w: 100, h: 100, fit: "crop"})

  def large_image(image_id) do
    image(image_id, %{h: 500, fit: "crop"})
  end

  def test() do
    Logger.info(large_image(0))
  end

  def render(assigns) do
    ~L"""
    <div>
      <h1>The count is: <%= @image_id %></h1>
      <button phx-click="prev">PREV</button>
      <button phx-click="next">NEXT</button>

      <img src="<%= thumbnail(@image_id) %>">
      <% if @current_user do %>
        <img src="<%= large_image(@image_id) %>">
      <% end %>
    </div>
    """
  end
end
