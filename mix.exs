defmodule EthPrice.Mixfile do
  use Mix.Project

  def project do
    [app: :eth_price,
     version: "0.0.4",
     elixir: "~> 1.3",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {EthPrice, []},
     applications: [
       :phoenix, :phoenix_html, :cowboy, :honeybadger, :logger,
       :gettext, :httpotion, :number, :jsx, :exrm
     ]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.2.1"},
     {:phoenix_html, "~> 2.8"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:honeybadger, "~> 0.1"},
     {:gettext, "~> 0.9"},
     {:cowboy, "~> 1.0"},
     {:httpotion, "~> 3.0.1"},
     {:number, "~> 0.4.1"},
     {:jsx, "~> 2.8"},
     {:exrm, "~> 1.0"}
    ]
  end
end
