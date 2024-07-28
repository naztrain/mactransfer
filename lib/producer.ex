defmodule Producer do
  def send_message(topic, key, message) do
    KafkaEx.produce(topic, key, message)
    IO.puts("Sent to kafkas")
  end
end
