defmodule FauxtrisBackend.Score do
  @moduledoc false
  alias FauxtrisBackend.Scores.Insert

  defdelegate insert(score), to: Insert, as: :call
end
