defmodule Sisnuvempay.NumbersTest do
  use ExUnit.Case

  alias Sisnuvempay.Numbers

  describe "sum_from_file/1" do
    #test "When have a file with given name, returns the sum of numbers"
    test "Quando houver um arquivo com nome fornecido, retorna a soma dos numeros" do
      response = Numbers.sum_from_file("numbers")

      expected_response = {:ok, %{result: 37}}

      assert response == expected_response
    end

    #test "When there is no file with given name, returns an error"
    test "Quando nao houver arquivo com o nome fornecido, retorna um erro" do
      response = Numbers.sum_from_file("banana")

      expected_response = {:error, "Arquivo invalido!"}

      assert response == expected_response
    end
  end
end
