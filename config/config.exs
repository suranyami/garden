# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :garden,
  ecto_repos: [Garden.Repo]

config :garden_web,
  ecto_repos: [Garden.Repo],
  generators: [context_app: :garden]

# Configures the endpoint
config :garden_web, GardenWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2WPQxA7JqojyugIlK9ZpvG5sN5JB/KIz4mwZUMtx1CxdJEdLXZvtIWQtpmLNAiyR",
  render_errors: [view: GardenWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: GardenWeb.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "yGNZMthW"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
