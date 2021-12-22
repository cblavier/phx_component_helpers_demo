defmodule PhxComponentHelpersDemoWeb.Router do
  use PhxComponentHelpersDemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PhxComponentHelpersDemoWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", PhxComponentHelpersDemoWeb do
    pipe_through :browser
    live "/", PageLive, :index
  end
end
