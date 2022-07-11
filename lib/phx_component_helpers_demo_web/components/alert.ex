defmodule PhxComponentHelpersDemoWeb.Components.Alert do
  use PhxComponentHelpersDemoWeb, :component
  import PhxComponentHelpers

  alias PhxComponentHelpersDemoWeb.Components.Button

  def alert(assigns) do
    assigns
    |> set_attributes([:title, :message], required: [:title])
    |> extend_class("rounded-md bg-yellow-50 p-4 mb-4", prefix_replace: false)
    |> extend_class("text-sm font-medium text-yellow-800",
      attribute: :title_class,
      prefix_replace: false
    )
    |> render()
  end

  defp render(assigns) do
    ~H"""
    <div {@heex_class}>
      <div class="flex w-full justify-between">
      <h3 {@heex_title_class}>
        <i class="fa fa-exclamation-circle text-yellow-400 mr-2 fa-lg"/>
        <%= @title %>
      </h3>
        <.live_component module={Button} label="Click me!"
          {forward_assigns(assigns, prefix: :button)}
        />
      </div>
    </div>
    """
  end
end
