defmodule NewPlayground.Repo do
  use Ecto.Repo,
    otp_app: :new_playground,
    adapter: Ecto.Adapters.Postgres
end
