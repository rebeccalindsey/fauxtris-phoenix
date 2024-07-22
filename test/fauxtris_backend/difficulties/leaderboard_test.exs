defmodule FauxtrisBackend.Difficulties.LeaderboardTest do
  use FauxtrisBackend.DataCase

  import FauxtrisBackend.Factory

  alias FauxtrisBackend.Difficulties.Leaderboard

  describe "get/1" do
    test "returns a list of difficulties with their associated scores" do
      easy_difficulty =
        insert!(:difficulty, level: "Easy", scores: [insert!(:score), insert!(:score)])

      medium_difficulty =
        insert!(:difficulty, level: "Medium", scores: [insert!(:score), insert!(:score)])

      hard_difficulty =
        insert!(:difficulty, level: "Hard", scores: [insert!(:score), insert!(:score)])

      {:ok, leaderboard} = Leaderboard.get()

      assert_difficulty(leaderboard, easy_difficulty, "Easy")
      assert_difficulty(leaderboard, medium_difficulty, "Medium")
      assert_difficulty(leaderboard, hard_difficulty, "Hard")
    end

    test "only returns the top ten scores for a single difficulty" do
      difficulty = insert!(:difficulty, level: "Easy")
      scores = for _counter <- 1..20, do: insert!(:score, difficulty: difficulty)

      sorted_scores = Enum.sort_by(scores, & &1.points, :desc)

      {:ok, [%{scores: returned_scores}]} = Leaderboard.get()

      assert length(returned_scores) == 10
      assert List.first(sorted_scores).id == List.first(returned_scores).id
      refute Enum.find(returned_scores, &(&1.id === Enum.at(sorted_scores, 10).id))
    end

    test "returns {:ok, []} when there are no difficulties to retrieve" do
      assert {:ok, []} == Leaderboard.get()
    end
  end

  defp assert_difficulty(leaderboard, seeded_difficulty, difficulty_level) do
    returned_difficulty =
      Enum.find(leaderboard, &(&1.level === difficulty_level))

    assert returned_difficulty
    assert returned_difficulty.scores == Enum.sort_by(seeded_difficulty.scores, & &1.points, :desc)
  end
end
