defmodule FauxtrisBackend.Scores.Insert do
  @moduledoc false

  alias FauxtrisBackend.Repo
  alias FauxtrisBackend.Scores.Score

  def call(%{"difficultyId" => difficulty_id, "initials" => initials, "points" => points}) do
    call(%{difficulty_id: difficulty_id, initials: initials, points: points})
  end

  def call(score) do
    %Score{}
    |> Score.changeset(score)
    |> Repo.insert()
  end
end
