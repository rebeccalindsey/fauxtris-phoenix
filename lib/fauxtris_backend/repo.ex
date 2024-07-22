defmodule FauxtrisBackend.Repo do
  use Ecto.Repo,
    otp_app: :fauxtris_backend,
    adapter: Ecto.Adapters.SQLite3
end
