use Mix.Config

config :appsignal, :config,
  otp_app: :phx_component_helpers_demo,
  name: "phx_component_helpers_demo",
  push_api_key: "30d06e3e-84d1-4c8d-97ff-78774849127c",
  env: Mix.env()
