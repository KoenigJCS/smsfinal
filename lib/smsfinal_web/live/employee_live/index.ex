defmodule SmsfinalWeb.EmployeeLive.Index do
  use SmsfinalWeb, :live_view

  alias Smsfinal.HumanRecources

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :employees, HumanRecources.list_employees())}
  end
end
