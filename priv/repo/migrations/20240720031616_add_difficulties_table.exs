defmodule FauxtrisBackend.Repo.Migrations.AddDifficultiesTable do
  @moduledoc false
  use Ecto.Migration

  def change do
    create table("difficulties") do
      add :level, :string, null: false

      timestamps()
    end
  end
end
