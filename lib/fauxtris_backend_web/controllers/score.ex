defmodule FauxtrisBackendWeb.Controllers.Score do
  @moduledoc false
  use Phoenix.Controller

  alias FauxtrisBackend.Score

  def insert(conn, new_score) do
    response =
      case Score.insert(new_score) do
        {:ok, inserted_struct} -> inserted_struct
        {:error, _error} -> "failed"
      end

    json(conn, response)
  end
end
