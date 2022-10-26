defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "When all params are valid, returns the user" do
      response = User.build("Sérgio Lima", "Gilvan", "gilvan@gmail.com", "123456789", 23)

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "When there are invalid parameters, returns an error" do
      response = User.build("Sérgio Lima", "Gilvan Jr.", "gilvan@gmail.com", "123456789", 15)

      expected_response = {:error, "Invalid parameters!"}

      assert response == expected_response
    end
  end
end
