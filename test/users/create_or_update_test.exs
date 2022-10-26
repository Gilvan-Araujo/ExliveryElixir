defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "Gilvan",
        address: "Rua Sérgio Lima",
        email: "gilva@gmail.com",
        cpf: "12345678900",
        age: 23
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created successfully!"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Gilvan",
        address: "Rua Sérgio Lima",
        email: "gilva@gmail.com",
        cpf: "12345678900",
        age: 10
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters!"}

      assert response == expected_response
    end
  end
end
