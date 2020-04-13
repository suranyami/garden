defmodule GardenWeb.Router do
  use GardenWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GardenWeb do
    pipe_through :api
  end
end
