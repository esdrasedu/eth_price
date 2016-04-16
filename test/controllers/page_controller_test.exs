defmodule EthPrice.PageControllerTest do
  use EthPrice.ConnCase
  import Phoenix.HTML.Form

  test "root route", %{conn: conn} do
    conn = get conn, "/"
    {:safe, input} = text_input(:ethereum, :value, value: 1.0, class: "price-input")
    assert html_response(conn, 200) =~ input
  end

  test "set param value with 1", %{conn: conn}  do
    conn = get conn, "/", %{ethereum: %{value: "1"}}
    {:safe, input} = text_input(:ethereum, :value, value: 1.0, class: "price-input")
    assert html_response(conn, 200) =~ input
  end

  test "set params value with 1.1", %{conn: conn}  do
    conn = get conn, "/", %{ethereum: %{value: "1.1"}}
    {:safe, input} = text_input(:ethereum, :value, value: 1.1, class: "price-input")
    assert html_response(conn, 200) =~ input
  end

  test "set params value empty", %{conn: conn}  do
    conn = get conn, "/", %{ethereum: %{value: ""}}
    {:safe, input} = text_input(:ethereum, :value, value: 1.0, class: "price-input")
    assert html_response(conn, 200) =~ input
  end

  test "set params value NaN", %{conn: conn}  do
    conn = get conn, "/", %{ethereum: %{value: "a"}}
    assert html_response(conn, 200) =~ "Bro, put only numbers"
  end

end
