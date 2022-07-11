defmodule PhxComponentHelpersDemoWeb.Components.Dropdown do
  use PhxComponentHelpersDemoWeb, :component
  import PhxComponentHelpers

  @class "relative inline-block text-left"
  @button_class "inline-flex justify-center w-full rounded-md border border-gray-300\
                shadow-sm px-4 py-2 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50"
  @dropdown_class "origin-top-left absolute left-0 mt-2 w-56 rounded-md shadow-lg bg-white"
  @dropdown_entry_class "text-gray-700 block px-4 py-2 text-sm"

  def dropdown(assigns) do
    assigns
    |> set_attributes(label: "Dropdown")
    |> extend_class(@class, prefix_replace: false)
    |> extend_class(@button_class, attribute: :button_class, prefix_replace: false)
    |> extend_class(@dropdown_class, attribute: :dropdown_class, prefix_replace: false)
    |> extend_class(@dropdown_entry_class, attribute: :dropdown_entry_class, prefix_replace: false)
    |> set_prefixed_attributes(["x-data"], into: :init_alpine)
    |> set_prefixed_attributes(["x-bind", "x-on"])
    |> render()
  end

  defp render(assigns) do
    ~H"""
    <div {@heex_class} {@heex_init_alpine}>
      <div>
        <button type="button" {@heex_button_class} {assigns[:"heex_x-on:click"]}>
          <%= @label %>
        </button>
      </div>

      <div {@heex_dropdown_class} {assigns[:"heex_x-bind:class"]}>
        <div class="py-1">
          <a {@heex_dropdown_entry_class}>Account settings</a>
          <a {@heex_dropdown_entry_class}>Support</a>
          <a {@heex_dropdown_entry_class}>License</a>
        </div>
      </div>
    </div>
    """
  end
end
