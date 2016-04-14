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
    case Float.parse("#{value}") do
      :error ->
        conn
        |> put_flash(:error, "Bro, put only numbers")
        |> index(1)
      {value_f, _} ->
        index(conn, value_f)
    end
  end

  def index(conn, _), do: index(conn, 1.0)

end
