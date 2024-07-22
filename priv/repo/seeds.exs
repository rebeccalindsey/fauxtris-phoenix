# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FauxtrisBackend.Repo.insert!(%FauxtrisBackend.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias FauxtrisBackend.Difficulties.Difficulty
alias FauxtrisBackend.Repo
alias FauxtrisBackend.Scores.Score

unless Repo.exists?(Difficulty) do
  Enum.map(["Easy", "Medium", "Hard"], fn difficulty_level ->
    difficulty = Repo.insert!(%Difficulty{level: difficulty_level})

    for s <- 1..10,
        do:
          Repo.insert!(%Score{
            points: -10,
            initials: Enum.reduce(0..2, "", fn _, acc -> acc <> <<Enum.random(?A..?Z)::utf8>> end),
            difficulty: difficulty
          })
  end)
end
