defmodule Roomrate.Repo do
  use Ecto.Repo,
    otp_app: :roomrate,
    adapter: Ecto.Adapters.SQLite3
end
