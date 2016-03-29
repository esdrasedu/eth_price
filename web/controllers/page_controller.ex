defmodule EthPrice.PageController do
  use EthPrice.Web, :controller

  def index(conn, value) when is_float(value) do
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

  def index(conn, %{"ethereum" => %{"value" => ""}}), do: index(conn, 1.0)

  def index(conn, %{"ethereum" => %{"value" => value}}) do
    {value_f, _} = Float.parse("#{value}")
    index(conn, value_f)
  end

  def index(conn, _), do: index(conn, 1.0)

end
