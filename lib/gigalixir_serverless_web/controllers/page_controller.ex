defmodule GigalixirServerlessWeb.PageController do
  use GigalixirServerlessWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
