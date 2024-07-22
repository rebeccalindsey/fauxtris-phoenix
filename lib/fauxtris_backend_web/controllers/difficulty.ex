defmodule FauxtrisBackendWeb.Controllers.Difficulty do
  @moduledoc false
  use Phoenix.Controller

  alias FauxtrisBackend.Difficulty

  def get_leaderboard(conn, _args) do
    {:ok, leaderboard} = Difficulty.get_leaderboard()

    json(conn, leaderboard)
  end
end
