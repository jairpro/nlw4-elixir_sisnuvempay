defmodule Sisnuvempay.Repo do
  use Ecto.Repo,
    otp_app: :sisnuvempay,
    adapter: Ecto.Adapters.Postgres
end
