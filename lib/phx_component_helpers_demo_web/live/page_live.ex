defmodule PhxComponentHelpersDemoWeb.PageLive do
  use PhxComponentHelpersDemoWeb, :live_view

  alias PhxComponentHelpersDemoWeb.PageView

  def render(assigns) do
    PageView.render("index.html", assigns)
  end
end
