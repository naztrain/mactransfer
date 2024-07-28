defmodule Codespace1.Application do
  use Application

  def start(_type, _args) do
    consumer_group_opts = [
      # setting for the ConsumerGroup
      heartbeat_interval: 1_000,
      # this setting will be forwarded to the GenConsumer
      commit_interval: 1_000
    ]

    gen_consumer_impl = Consumer
    consumer_group_name = "BradsConsumerGroupNameNew"
    topic_names = ["BradsTopicx"]
    IO.puts("Starting supervisor")
    children = [
      # ... other children
      %{
        id: KafkaEx.ConsumerGroup,
        start: {
          KafkaEx.ConsumerGroup,
          :start_link,
          [gen_consumer_impl, consumer_group_name, topic_names, consumer_group_opts]
        }
      }
      # ... other children
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end


# defmodule Codespace1.Application do
#   @moduledoc false

#   use Application

#   def start(_type, _args) do
#     children = [
#       Codespace1.KafkaBroadway
#     ]

#     opts = [strategy: :one_for_one, name: Codespace1.Supervisor]
#     Supervisor.start_link(children, opts)
#   end
# end
