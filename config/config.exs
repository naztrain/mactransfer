use Mix.Config

config :kafka_ex,
  brokers: [
    {"localhost", 9092}
  ],
  consumer_group: "BradsConsumerGroupName",
  disable_default_worker: true,
  use_ssl: false,
  sync_timeout: 1000,
  max_restarts: 10,
  max_seconds: 60


# config :Codespace1, Codespace1.KafkaBroadway,
#   kafka: [
#     hosts: [localhost: 9092],
#     group_id: "my_group",
#     topics: ["my_topic"]
#   ]