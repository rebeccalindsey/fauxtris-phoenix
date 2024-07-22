defmodule FauxtrisBackend.Difficulty do
  @moduledoc false
  alias FauxtrisBackend.Difficulties.Leaderboard

  defdelegate get_leaderboard(), to: Leaderboard, as: :get
end
