defmodule Smsfinal.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SmsfinalWeb.Telemetry,
      # Start the Ecto repository
      Smsfinal.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Smsfinal.PubSub},
      # Start Finch
      {Finch, name: Smsfinal.Finch},
      # Start the Endpoint (http/https)
      SmsfinalWeb.Endpoint
      # Start a worker by calling: Smsfinal.Worker.start_link(arg)
      # {Smsfinal.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Smsfinal.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SmsfinalWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
