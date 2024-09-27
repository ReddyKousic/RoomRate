# defmodule Roomrate.Application do
#   # See https://hexdocs.pm/elixir/Application.html
#   # for more information on OTP Applications
#   @moduledoc false

#   use Application

#   @impl true
#   def start(_type, _args) do
#     children = [
#       RoomrateWeb.Telemetry,
#       Roomrate.Repo,
#       {DNSCluster, query: Application.get_env(:roomrate, :dns_cluster_query) || :ignore},
#       {Phoenix.PubSub, name: Roomrate.PubSub},
#       # Start the Finch HTTP client for sending emails
#       {Finch, name: Roomrate.Finch},
#       # Start a worker by calling: Roomrate.Worker.start_link(arg)
#       # {Roomrate.Worker, arg},
#       # Start to serve requests, typically the last entry
#       RoomrateWeb.Endpoint
#     ]

#     # See https://hexdocs.pm/elixir/Supervisor.html
#     # for other strategies and supported options
#     opts = [strategy: :one_for_one, name: Roomrate.Supervisor]
#     Supervisor.start_link(children, opts)
#   end

#   # Tell Phoenix to update the endpoint configuration
#   # whenever the application is updated.
#   @impl true
#   def config_change(changed, _new, removed) do
#     RoomrateWeb.Endpoint.config_change(changed, removed)
#     :ok
#   end
# end
# lib/roomrate/application.ex
defmodule Roomrate.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Roomrate.Repo,
      # Start the Telemetry supervisor
      RoomrateWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Roomrate.PubSub},
      # Start the Endpoint (http/https)
      RoomrateWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Roomrate.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
