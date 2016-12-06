require_relative '../config/environment'

DeathAPI.new.fetch_deaths
DeathCLI.new.call
