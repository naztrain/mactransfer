defmodule Consumer do
  use KafkaEx.GenConsumer

  def handle_message_set(message_set, state) do
    IO.puts("Handle message")
    message_set
    |> Enum.each(&process_message/1)

    {:async_commit, state}
  end
  

  defp process_message(%KafkaEx.Protocol.Fetch.Message{value: message}) do
    IO.puts("Received message: #{message}")
  end
end
