module WitBot
  module Base
    cattr_accessor :client_class
    self.client_class = Wit

    def actions
      {}.merge(send_action)
    end

    def client
      @client ||= client_class.new(
        access_token: ENV['WIT_AI_ACCESS_TOKEN'],
        actions: actions
      )
    end

    private

    def send_action
      {
        send: lambda { |_request, response|
          Rails.logger.info("sending... #{response['text']}")
        }
      }
    end
  end
end