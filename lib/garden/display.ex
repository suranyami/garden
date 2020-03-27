defmodule Garden.Display do
  use GenServer
  require Logger

  alias GrovePi.{DHT}

  def start_link(dht_pin) do
    GenServer.start_link(__MODULE__, dht_pin)
  end

  def init(dht_pin) do
    DHT.subscribe(dht_pin, :changed)
    {:ok, []}
  end

  def handle_info({_pin, :changed, %{temp: temp, humidity: humidity}}, state) do
    text = format_text(temp, humidity)
    Logger.info text
    {:noreply, state}
  end

  def handle_info(_message, state) do 
    # handle any unexpected messages
    {:noreply, state}
  end

  defp format_text(temp, humidity) do
    "T: #{Float.to_string(temp)}C H: #{Float.to_string(humidity)}%"
  end
end