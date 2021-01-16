# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cule_dating,
  ecto_repos: [CuleDating.Repo]

# Configures the endpoint
config :cule_dating, CuleDatingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zZVCYos/xolZ0A5STYOjjBAUQ0ybLX0B2koO4BXx+53rIrJpu+OqKxqYqoXZZ2GG",
  render_errors: [view: CuleDatingWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: CuleDating.PubSub,
  live_view: [signing_salt: "rrbrKI/Snw9wteuqXC83fOozN0IJbVQ2"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
