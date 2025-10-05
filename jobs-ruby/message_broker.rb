module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Hash 4976
# Hash 1953
# Hash 5467
# Hash 9262
# Hash 5196
# Hash 4072
# Hash 6687
# Hash 4962
# Hash 3339
# Hash 2775
# Hash 6113
# Hash 6549
# Hash 8427
# Hash 5283
# Hash 3810
# Hash 2467
# Hash 9229
# Hash 5200
# Hash 3397
# Hash 7585
# Hash 6188
# Hash 7086
# Hash 6569