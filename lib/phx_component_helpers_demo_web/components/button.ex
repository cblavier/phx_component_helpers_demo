defmodule PhxComponentHelpersDemoWeb.Components.Button do
  use PhxComponentHelpersDemoWeb, :live_component
  import PhxComponentHelpers

  def update(assigns, socket) do
    assigns =
      assigns
      |> set_phx_attributes()
      |> set_attributes([:label, color: :indigo], required: [:label])
      |> extend_class(&button_class/1, prefix_replace: false)

    {:ok, assign(socket, assigns)}
  end

  def render(assigns) do
    ~H"""
    <button {@heex_class} {@heex_phx_attributes} phx-target={@myself}>
      <%= @label %>
    </button>
    """
  end

  def handle_event("change_color", _, socket) do
    assigns = extend_class(%{color: random_color()}, &button_class/1, prefix_replace: false)
    {:noreply, assign(socket, assigns)}
  end

  defp button_class(assigns) do
    "inline-flex items-center px-4 py-2 border border-transparent text-sm\
    font-medium rounded-md shadow-sm text-white #{color(assigns)}"
  end

  defp random_color, do: Enum.random([:indigo, :yellow, :red, :purple, :emerald])
  defp color(%{color: :indigo}), do: "bg-indigo-600 hover:bg-indigo-700"
  defp color(%{color: :yellow}), do: "bg-yellow-400 hover:bg-yellow-500"
  defp color(%{color: :red}), do: "bg-red-600 hover:bg-red-700"
  defp color(%{color: :purple}), do: "bg-purple-600 hover:bg-purple-700"
  defp color(%{color: :emerald}), do: "bg-emerald-600 hover:bg-emerald-700"
end
