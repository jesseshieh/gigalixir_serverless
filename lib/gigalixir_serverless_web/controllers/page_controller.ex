defmodule GigalixirServerlessWeb.PageController do
  use GigalixirServerlessWeb, :controller

  # curl localhost:4000/api -d '{"code": "def handle(params) do 1234567 end", "id": 1, "version": 2, "handler": "handle", "params": "[:nothing]"}' -H 'Content-Type: application/json'
  # {"data":1234567}
  def index(conn, %{
        "code" => code,
        "id" => id,
        "version" => version,
        "handler" => handler,
        "params" => params
      }) do
    handler = String.to_atom(handler)
    {params, []} = Code.eval_string(params)
    module = GigalixirServerless.Compiler.compile(code, id, version)
    json(conn, %{data: apply(module, handler, params)})
  end
end
