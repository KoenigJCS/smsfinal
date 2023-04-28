defmodule Smsfinal.Repo do
  use Ecto.Repo,
    otp_app: :smsfinal,
    adapter: Ecto.Adapters.Postgres
end
