defmodule Sisnuvempay.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Sisnuvempay.Repo,
      # Start the Telemetry supervisor
      SisnuvempayWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Sisnuvempay.PubSub},
      # Start the Endpoint (http/https)
      SisnuvempayWeb.Endpoint
      # Start a worker by calling: Sisnuvempay.Worker.start_link(arg)
      # {Sisnuvempay.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sisnuvempay.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SisnuvempayWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
