require "./lib/wit_bot/base.rb"
module WitBot
  class Message
    include Base

    MAX_MESSAGE_LENGTH = 255

    def send(message)
      client.message(truncated_message(message))
    end

    private

    def truncated_message(message)
      message.truncate(MAX_MESSAGE_LENGTH, omission: '')
    end
  end
end
