defmodule PhxComponentHelpersDemoWeb.Components.Badge do
  use PhxComponentHelpersDemoWeb, :component
  import PhxComponentHelpers

  @class "inline-flex items-center px-3 py-0.5 rounded-full\
          text-sm font-medium bg-blue-100 text-blue-800"

  @dot_class "-ml-0.5 mr-1.5 h-2.5 w-2 text-blue-400"

  def badge(assigns) do
    assigns
    |> set_attributes([:label, dot: false], required: [:label])
    |> extend_class(@class, prefix_replace: false)
    |> extend_class(@dot_class, attribute: :dot_class, prefix_replace: false)
    |> render()
  end

  defp render(assigns) do
    ~H"""
    <span {@heex_class}>
      <%= if @dot do %>
        <svg {@heex_dot_class} fill="currentColor" viewBox="0 0 7 7">
          <circle cx="4" cy="4" r="3" />
        </svg>
      <% end %>
      <%= @label %>
    </span>
    """
  end
end
