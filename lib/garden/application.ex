defmodule Garden.Application do
  use Application
  @dht_pin 7 # Use port D7 for the DHT
  @dht_poll_interval 1_000 # Poll every 1 second

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(GrovePi.DHT, [@dht_pin, [poll_interval: @dht_poll_interval]]),
      worker(Garden.Display, [@dht_pin])
    ]

    opts = [strategy: :one_for_one, name: HomeWeatherDisplay.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
