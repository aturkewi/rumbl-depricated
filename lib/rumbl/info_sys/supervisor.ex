defmodule Rumbl.InfoSys.Supervisor do
  use Supervisor

  def start_link() do
    IO.puts "Supervisor's link started!"
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def puts_name do
    IO.puts __MODULE__
    #=> Elixir.Rumbl.InfoSys.Supervisor
  end

  def init(_opts) do
    IO.puts "Supervisor inited"
    children = [
      worker(Rumbl.InfoSys, [], restart: :temporary)
    ]
    supervise children, strategy: :simple_one_for_one
  end
end
