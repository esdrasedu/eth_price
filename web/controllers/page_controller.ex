defmodule EthPrice.PageController do
  use EthPrice.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
