defmodule NewPlayground.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      NewPlaygroundWeb.Telemetry,
      NewPlayground.Repo,
      {DNSCluster, query: Application.get_env(:new_playground, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: NewPlayground.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: NewPlayground.Finch},
      # Start a worker by calling: NewPlayground.Worker.start_link(arg)
      # {NewPlayground.Worker, arg},
      # Start to serve requests, typically the last entry
      NewPlaygroundWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NewPlayground.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NewPlaygroundWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
