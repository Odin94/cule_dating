defmodule CuleDating.Repo do
  use Ecto.Repo,
    otp_app: :cule_dating,
    adapter: Ecto.Adapters.Postgres
end
