defmodule FauxtrisBackend.Difficulties.Difficulty do
  @moduledoc false
  use Ecto.Schema

  alias FauxtrisBackend.Scores.Score

  @type t :: %__MODULE__{
          level: String.t()
        }

  @derive {Jason.Encoder, only: [:id, :level, :scores]}

  schema "difficulties" do
    field :level, :string
    has_many :scores, Score
    timestamps()
  end
end
