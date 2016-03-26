defmodule EthPrice.PageController do
  use EthPrice.Web, :controller

  def index(conn, %{"ethereum" => %{"value" => value}}) do
    conn
    |> assign(:ethereum, %{value: value, price: 1.00})
    |> render
  end

  def index(conn, _), do: index(conn, %{"ethereum" => %{"value" => 1}})

end
