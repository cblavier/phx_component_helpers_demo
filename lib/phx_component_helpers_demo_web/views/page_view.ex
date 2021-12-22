defmodule PhxComponentHelpersDemoWeb.PageView do
  use PhxComponentHelpersDemoWeb, :view

  import PhxComponentHelpersDemoWeb.Components.Badge

  def samples do
    [
      %{
        title: "Basic - set_attributes & extend_class",
        template: "_basic.html",
        component: "badge.ex",
        description: """
        This is the basic example showing how you can pass attribute to your components
        with required values and providing defaults.
        It also illustrates how extend_class makes it easy to adjust your component styling
        from the markup.
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
