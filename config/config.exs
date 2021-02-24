# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :sisnuvempay,
  ecto_repos: [Sisnuvempay.Repo]

# Configures the endpoint
config :sisnuvempay, SisnuvempayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WEpSngqsboZOIeVibS7qsWR1yCKhSHEqclybqQH96pNexPsdfOp9NLLDXgmTF4ST",
  render_errors: [view: SisnuvempayWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Sisnuvempay.PubSub,
  live_view: [signing_salt: "xpk66EeW"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
