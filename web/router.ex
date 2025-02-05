defmodule ExdWeb.Router do
  use ExdWeb.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ExdWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/:application", PageController, :show
    get "/:application/:model", PageController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", ExdWeb do
  #   pipe_through :api
  # end
end
