defmodule EthPrice.LayoutView do
  use EthPrice.Web, :view

  def version do
    :application.which_applications
    |> Enum.find(fn({app, _name, _version}) -> app == :eth_price end)
    |> elem(2)
    |> to_string()
  end

end
