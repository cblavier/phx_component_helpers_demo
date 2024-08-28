import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phx_component_helpers_demo, PhxComponentHelpersDemoWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "ZRpg33PudlEAjBUw+UEhCNNmiQpeC4WG0+0EBL4rINrAj+8AV33iC38qD3dh1kTc",
  server: false

# In test we don't send emails.
config :phx_component_helpers_demo, PhxComponentHelpersDemo.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
