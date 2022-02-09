import Config

if config_env() == :prod do
  config :level_up, contact_email: System.fetch_env!("CONTACT_EMAIL")
end
