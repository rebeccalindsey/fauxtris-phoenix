import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :fauxtris_backend, FauxtrisBackend.Repo,
  database: Path.expand("../fauxtris_backend_test.db", __DIR__),
  pool_size: 5,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :fauxtris_backend, FauxtrisBackendWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "oo/wnbmLWGu9+aCeu5ezDprFI9hQ+/tIzqa74AotjDt/l7ASp8BYmpnXgqpSPl6b",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
