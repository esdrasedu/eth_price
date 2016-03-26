defmodule EthPrice.PageController do
  use EthPrice.Web, :controller

  def index(conn, %{"ethereum" => %{"value" => value_i}}) do
    {value, _} = Float.parse("#{value_i}")
    case CryptoCoins.price(value, :ETH_REAL) do
      {:ok, price} ->
        conn
        |> assign(:ethereum, %{value: value, price: price})
        |> render
      {:fail, msg} ->
        conn
        |> assign(:ethereum, %{value: value, price: 0})
        |> put_flash(:error, msg)
        |> render
    end
  end

  def index(conn, _), do: index(conn, %{"ethereum" => %{"value" => 1}})

end
