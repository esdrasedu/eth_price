defmodule EthPrice.ErrorView do
  use EthPrice.Web, :view

  def render("404.html", _assigns) do
    render("default.html", %{error: "Where's my page?"})
  end

  def render("500.html", _assigns) do
    render("default.html", %{error: "What's happening?"})
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render "default.html", %{error: "Where's my template?"}
  end
end
