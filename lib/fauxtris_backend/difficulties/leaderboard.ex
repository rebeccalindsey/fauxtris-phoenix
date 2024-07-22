defmodule FauxtrisBackend.Difficulties.Leaderboard do
  @moduledoc false

  import Ecto.Query

  alias FauxtrisBackend.Difficulties.Difficulty
  alias FauxtrisBackend.Repo
  alias FauxtrisBackend.Scores.Score

  def get do
    difficulties = Repo.all(Difficulty)

    difficulties_with_scores =
      Enum.map(difficulties, fn difficulty ->
        scores_subquery =
          from s in Score,
            where: s.difficulty_id == ^difficulty.id,
            order_by: [desc: s.points],
            limit: 10

        scores = Repo.all(scores_subquery)

        %{difficulty | scores: scores}
      end)

    {:ok, difficulties_with_scores}
  end
end
