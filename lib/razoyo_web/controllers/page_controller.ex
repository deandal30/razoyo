defmodule RazoyoWeb.PageController do
  use RazoyoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
