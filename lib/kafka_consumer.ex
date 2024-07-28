defmodule KafkaConsumer do
  use GenServer
  require Logger

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    KafkaEx.create_worker(:consumer, consumer_group: "kafka_ex_consumer_group")
    
    KafkaEx.stream("your_topic_name", worker_name: :consumer)
    |> Enum.each(fn message ->
      handle_message(message)
    end)
    {:ok, %{}}
  end

  def handle_message(%KafkaEx.Protocol.Fetch.Message{value: value}) do
    Logger.info("Consumed message: #{value}")
    # Add your message processing logic here
  end
end
