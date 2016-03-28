defmodule CryptoCoins do

  def price(value, coin) when is_bitstring(value) do
    {value_f, _} = Float.parse(value)
    price(value_f, coin)
  end

  def price(value, :ETH_REAL) do
    case price(1, :BTC_ETH) do
      {:ok, val_eth} -> price((value * val_eth), :BTC_REAL)
      error -> error
    end
  end

  def price(value, :BTC_REAL) do
    case HTTPotion.get("https://www.mercadobitcoin.net/api/v2/ticker/") do
      %{status_code: 200, body: raw} ->
        %{"ticker" => %{"last" => last_change}} = :jsx.decode(raw, [:return_maps])
        {:ok, (last_change * value)}
      _error -> {:fail, "MercadoBitcoin is not responding"}
    end
  end

  def price(value, :BTC_ETH) do
    case HTTPotion.get("https://poloniex.com/public?command=returnTicker", [timeout: 10_000]) do
      %{status_code: 200, body: raw} ->
        %{"BTC_ETH" => %{"last" => last_change}} = :jsx.decode(raw, [:return_maps])
        {:ok, (String.to_float(last_change) * value)}
      _error -> {:fail, "Poloniex is not responding"}
    end
  end

end
