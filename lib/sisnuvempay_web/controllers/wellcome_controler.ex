defmodule SisnuvempayWeb.WellcomeController do
  use SisnuvempayWeb, :controller

  alias Sisnuvempay.Numbers

  def index(conn, %{"filename" => filename}) do
    filename
    |>Numbers.sum_from_file()
    |>handle_response(conn)
  end

  defp handle_response({:ok, %{result: result}}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Bem-vindo ao Sisnuvempay API. Aqui seu numero: #{result}" })
  end

  defp handle_response({:error, reason}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(reason)
  end
end
