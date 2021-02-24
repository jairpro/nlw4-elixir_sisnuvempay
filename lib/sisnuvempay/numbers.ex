defmodule Sisnuvempay.Numbers do
  def sum_from_file_old(filename) do
    file = File.read("#{filename}.csv")
    #{:ok, file} = File.read("#{filename}.csv")
    handle_file_old(file)
  end
  #
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
    #>handle_file("arg2", "arg3")
  end

  defp handle_file_old({:ok, file}), do: file
  #defp handle_file({:error, _reason}), do: {:error, "Arquivo inválido!"}
  defp handle_file_old({:error, _reason}), do: {:error, "Arquivo invalido!"}
  #
  defp handle_file({:ok, result}) do
    result =
      result
      |>String.split(",")
      #|>Enum.map(fn number->String.to_integer(number) end)
      |>Stream.map(fn number->String.to_integer(number) end)
      |>Enum.sum()

    {:ok, %{result: result}}
  end

  defp handle_file({:error, _reason}), do: {:error, "Arquivo invalido!"}
end
