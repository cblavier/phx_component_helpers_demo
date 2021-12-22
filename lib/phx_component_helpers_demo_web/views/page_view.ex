defmodule PhxComponentHelpersDemoWeb.PageView do
  use PhxComponentHelpersDemoWeb, :view

  import PhxComponentHelpersDemoWeb.Components.{Alert, Badge, Dropdown}
  alias PhxComponentHelpersDemoWeb.Components.Button

  def samples do
    [
      %{
        title: "set_attributes & extend_class",
        anchor: "set_attributes",
        template: "_set_attributes.html",
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
        anchor: "phx_attributes",
        template: "_phx_attributes.html",
        component: "button.ex",
        description: """
        phx_component_helpers are also working for <strong>live_components</strong>. It provides
        a useful feature to <strong>pass all phx-* attributes</strong> at once to your component markup.
        <br/>
        In this sample, we also show how <strong><code>extend_class</code></strong> can be used with
        a function.
        """
      },
      %{
        title: "set_prefixed_attributes",
        anchor: "set_prefixed_attributes",
        template: "_set_prefixed_attributes.html",
        component: "dropdown.ex",
        description: """
        Using <strong><code>set_prefixed_attributes</code></strong> you can forward <strong>multiple assigns
        at once.</strong> For example it's very convenient to detect and merge a whole set of x-
        attributes <strong>when using alpinejs</strong>.
        """
      },
      %{
        title: "forward_assigns",
        anchor: "forward_assigns",
        template: "_forward_assigns.html",
        component: "alert.ex",
        description: """
        This code sample shows how <strong>nested components</strong> than still be customized from template
        markup: by using <strong><code>forward_assigns</code></strong> all assigns prefixed by <code>:button_</code>
        are forwarded to the button sub component.
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
