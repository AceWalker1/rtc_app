defmodule RtcApp.Repo do
  use Ecto.Repo,
    otp_app: :rtc_app,
    adapter: Ecto.Adapters.Postgres
end
