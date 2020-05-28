defmodule Garden.MixProject do
  use Mix.Project

  def project do
    [
      app: :garden,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:grovepi, github: "suranyami/grovepi", branch: "hdc1080"}
    ]
  end
end
