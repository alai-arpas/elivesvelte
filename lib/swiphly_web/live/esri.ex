defmodule SwiphlyWeb.Esri do
  use SwiphlyWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, content: "andrea")}
  end

  def render(assigns) do
    ~H"""
      <.live_component module={SwiphlyWeb.SvelteComponent} id="esri" name="AgisSvelte" props={%{content: @content}} />
    """
  end
end
