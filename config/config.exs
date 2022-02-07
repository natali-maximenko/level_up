import Config

config :level_up, contact_email: "info@elixirschool.com"

import_config("#{config_env()}.exs")
