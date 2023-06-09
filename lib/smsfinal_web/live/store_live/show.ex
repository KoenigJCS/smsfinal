defmodule SmsfinalWeb.StoreLive.Show do
  use SmsfinalWeb, :live_view

  alias Smsfinal.Company

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:store, Company.get_store!(id))
     |> assign(:products, Company.list_products())}
  end

  defp page_title(:show), do: "Show Store"
  defp page_title(:edit), do: "Edit Store"
end
