defmodule GigalixirServerlessWeb.Router do
  use GigalixirServerlessWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/", GigalixirServerlessWeb do
  #   pipe_through :browser
  # end

  scope "/api", GigalixirServerlessWeb do
    pipe_through :api

    post "/", PageController, :index
  end
end
