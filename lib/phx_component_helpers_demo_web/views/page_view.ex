defmodule PhxComponentHelpersDemoWeb.PageView do
  use PhxComponentHelpersDemoWeb, :view

  import PhxComponentHelpersDemoWeb.Components.Badge
  alias PhxComponentHelpersDemoWeb.Components.Button

  def samples do
    [
      %{
        title: "set_attributes & extend_class",
        template: "_basic.html",
        component: "badge.ex",
        description: """
        This is the basic example showing how you can <strong>pass attributes</strong> to your
        components with <strong>required</strong> values and providing <strong>defaults</strong>.
        It also illustrates how <strong><code>extend_class</code></strong> makes it easy to adjust
        your component styling from the markup.
        """
      },
      %{
        title: "live_component & phx_attributes",
        template: "_phx_attributes.html",
        component: "button.ex",
        description: """
        phx_component_helpers are also working for <strong>live_components</strong>. It provides
        a useful feature to <strong>pass all phx-* attributes</strong> at once to your component markup.
        <br/>
        In this sample, we also show how <strong><code>extend_class</code></strong> can be used with
        a function.
        """
      }
    ]
  end

  def template_code(template) do
    "../templates/page/#{template}.heex" |> Path.expand(__DIR__) |> File.read!() |> String.trim()
  end

  def component_code(component) do
    "../components/#{component}" |> Path.expand(__DIR__) |> File.read!() |> String.trim()
  end
end
