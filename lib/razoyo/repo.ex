defmodule Razoyo.Repo do
  use Ecto.Repo,
    otp_app: :razoyo,
    adapter: Ecto.Adapters.Postgres
end
