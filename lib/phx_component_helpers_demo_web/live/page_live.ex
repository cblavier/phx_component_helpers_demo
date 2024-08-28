defmodule PhxComponentHelpersDemoWeb.PageLive do
  use PhxComponentHelpersDemoWeb, :live_view
  alias PhxComponentHelpersDemoWeb.PageHTML

  def render(assigns) do
    ~H"""
    <div class="relative mx-auto pt-16 pb-4">
      <h1 class="font-extrabold font-mono tracking-tight text-slate-700 text-2xl sm:text-3xl lg:text-4xl">
        phx_component_helpers
      </h1>
      <p class="mt-6 text-lg md:text-xl text-slate-400 max-w-3xl">
        Extensible Phoenix liveview components, without boilerplate. <br />
        Demonstration & code samples.
      </p>

      <div class="flex justify-start text-slate-600 mt-4">
        <a
          href="https://github.com/cblavier/phx_component_helpers"
          target="_blank"
          class="hover:text-emerald-300"
        >
          <i class="fab fa-github"></i> Github
        </a>
        &nbsp;-&nbsp;
        <a
          href="https://hexdocs.pm/phx_component_helpers"
          target="_blank"
          class="hover:text-emerald-300"
        >
          <i class="fa fa-book"></i> API Documentation
        </a>
      </div>
    </div>

    <%= for sample <- samples() do %>
      <h2 class="text-slate-600 text-xl font-bold mt-12 group">
        <a
          id={sample.template}
          href={"##{sample.template}"}
          class="focus-outline-none hover:text-emerald-300"
        >
          <%= sample.title %>
          <i class="fas fa-sm fa-link hidden group-hover:inline text-slate-400 ml-1" />
        </a>
        <div class="w-full border-t border-gray-200 my-2"></div>
      </h2>

      <p class="text-slate-400 pt-2 pb-6">
        <%= raw(sample.description) %>
      </p>

      <div>
        <%= apply(PageHTML, String.to_existing_atom(sample.template), [assigns]) %>
      </div>

      <pre>
        <code id={"template-code-#{sample.template}"} phx-hook="Highlight" phx-update="ignore" class="language-elixir" >
    <%= template_code(sample.template) %>
        </code>
      </pre>

      <pre>
        <code id={"component-code-#{sample.template}"} phx-hook="Highlight" phx-update="ignore" class="language-elixir">
    <%= component_code(sample.component) %>
        </code>
      </pre>
    <% end %>
    """
  end

  defp samples do
    [
      %{
        title: "set_attributes & extend_class",
        template: "set_attributes",
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
        template: "phx_attributes",
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
        template: "set_prefixed_attributes",
        component: "dropdown.ex",
        description: """
        Using <strong><code>set_prefixed_attributes</code></strong> you can forward <strong>multiple assigns
        at once.</strong> For example it's very convenient to detect and merge a whole set of x-
        attributes <strong>when using alpinejs</strong>.
        """
      },
      %{
        title: "forward_assigns",
        template: "forward_assigns",
        component: "alert.ex",
        description: """
        This code sample shows how <strong>nested components</strong> than still be customized from template
        markup: by using <strong><code>forward_assigns</code></strong> all assigns prefixed by <code>:button_</code>
        are forwarded to the button sub component.
        """
      }
    ]
  end

  defp template_code(template) do
    "./templates/#{template}.html.heex"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.trim()
  end

  defp component_code(component) do
    "../components/#{component}"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.trim()
  end
end
