defmodule GigalixirServerless.Repo do
  use Ecto.Repo,
    otp_app: :gigalixir_serverless,
    adapter: Ecto.Adapters.Postgres
end
