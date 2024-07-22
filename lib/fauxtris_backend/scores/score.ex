defmodule FauxtrisBackend.Scores.Score do
  @moduledoc false
  use Ecto.Schema

  import Ecto.Changeset

  alias FauxtrisBackend.Difficulties.Difficulty

  @type t :: %__MODULE__{
          points: Integer.t(),
          initials: String.t(),
          difficulty_id: Integer.t()
        }

  @fields [:difficulty_id, :initials, :points]

  @derive {Jason.Encoder, only: [:points, :initials, :difficulty_id]}

  schema "scores" do
    field :points, :integer
    field :initials, :string
    belongs_to :difficulty, Difficulty
    timestamps()
  end

  def changeset(score, params \\ %{}) do
    score
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:initials, is: 3)
  end
end
