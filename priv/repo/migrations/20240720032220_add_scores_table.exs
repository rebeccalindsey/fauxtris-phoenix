defmodule FauxtrisBackend.Repo.Migrations.AddScoresTable do
  @moduledoc false
  use Ecto.Migration

  def change do
    create table("scores") do
      add :points, :integer, null: false
      add :initials, :string, size: 3, null: false
      add :difficulty_id, references(:difficulties), null: false

      timestamps()
    end
  end
end
