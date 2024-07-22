defmodule FauxtrisBackendWeb.Router do
  use FauxtrisBackendWeb, :router

  alias FauxtrisBackendWeb.Controllers.Difficulty, as: DifficultyController
  alias FauxtrisBackendWeb.Controllers.Score, as: ScoreController

  pipeline :api do
    plug(:accepts, ["json"])
    # plug(CORSPlug)
  end

  scope "/api", FauxtrisBackendWeb do
    pipe_through(:api)
  end

  get("/api/leaderboard", DifficultyController, :get_leaderboard)

  post("/api/score", ScoreController, :insert)
end
