defmodule Monitor3 do
  import :timer, only: [ sleep: 1 ]

  def child_process(parent) do
    # Send message to parent and then exit immediately
    send parent, "Simple message from child"
    raise RuntimeError, message: "what happens now?"
  end

  def receive_messages do
    receive do
      msg ->
        IO.puts "Received message: #{inspect msg}"
        receive_messages
    after 500 ->
        IO.puts "No messages left"
    end
  end

  def run do
    Process.flag(:trap_exit, true)

    res = spawn_monitor(Monitor3, :child_process, [self])
    IO.puts "[spawn monitor #{inspect res}]"

    sleep 500
    IO.puts "[done sleeping in parent]"

    # Receive as many messages as are waiting
    IO.puts "[start receiving messages]"
    receive_messages
  end
end

Monitor3.run
