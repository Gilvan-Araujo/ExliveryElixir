defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Gilvan",
      email: "gilvan@gmail.com",
      cpf: "123456789",
      age: 23,
      address: "Sérgio Lima"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de calabresa",
      category: :pizza,
      quantity: 1,
      unity_price: Decimal.new("35.5")
    }
  end

  def order_factory do
    %Order{
      user_cpf: "123456789",
      delivery_address: "Sérgio Lima",
      items: [
        build(:item),
        build(:item,
          description: "Temaki",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("20.5")
        )
      ],
      total_price: Decimal.new("76.50")
    }
  end
end
