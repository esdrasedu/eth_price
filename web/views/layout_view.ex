defmodule EthPrice.LayoutView do
  use EthPrice.Web, :view

  def version do
    EthPrice.Mixfile.project[:version]
  end

end
