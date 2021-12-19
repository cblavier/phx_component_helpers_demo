defmodule PhxComponentHelpersDemoWeb.PageController do
  use PhxComponentHelpersDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
