defmodule EthPrice.ErrorViewTest do
  use EthPrice.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.html" do
    assert render_to_string(EthPrice.ErrorView, "404.html", []) =~ "Where&#39;s my page?"
  end

  test "render 500.html" do
    assert render_to_string(EthPrice.ErrorView, "500.html", []) =~ "What&#39;s happening?"
  end

  test "render any other" do
    assert render_to_string(EthPrice.ErrorView, "default.html", %{error: "Test Error"}) =~ "Test Error"
  end
end
