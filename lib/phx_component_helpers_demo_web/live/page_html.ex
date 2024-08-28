defmodule PhxComponentHelpersDemoWeb.PageHTML do
  use PhxComponentHelpersDemoWeb, :html
  import PhxComponentHelpersDemoWeb.Components.{Alert, Badge, Dropdown}
  alias PhxComponentHelpersDemoWeb.Components.Button

  embed_templates "templates/*"
end
