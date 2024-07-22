defmodule FauxtrisBackend.Factory do
  @moduledoc false
  alias FauxtrisBackend.Difficulties.Difficulty
  alias FauxtrisBackend.Repo
  alias FauxtrisBackend.Scores.Score

  def build(:difficulty) do
    %Difficulty{level: "Easy"}
  end

  def build(:score) do
    %Score{
      points: Enum.random(1..10) * 10,
      initials: Enum.reduce(0..2, "", fn _, acc -> acc <> <<Enum.random(?A..?Z)::utf8>> end)
    }
  end

  # Convenience API

  def build(factory_name, attributes) do
    factory_name |> build() |> struct!(attributes)
  end

  def insert!(factory_name, attributes \\ []) do
    factory_name |> build(attributes) |> Repo.insert!()
  end
end
