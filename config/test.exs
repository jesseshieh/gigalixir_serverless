use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :gigalixir_serverless, GigalixirServerlessWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :gigalixir_serverless, GigalixirServerless.Repo,
  username: "postgres",
  password: "postgres",
  database: "gigalixir_serverless_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
