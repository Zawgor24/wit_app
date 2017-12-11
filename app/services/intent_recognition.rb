require './lib/wit_bot/message.rb'

# This class checks presence our custom intents at Wit.ai app
class IntentRecognition
  HELLO_INTENT = 'hello_present'.freeze
  TRASH_INTENT = 'trash_present'.freeze

  INTENTS = %i[hello trash].freeze

  attr_accessor :string

  def initialize(string)
    self.string = string
  end

  def intent
    INTENTS.detect { |intent| send("#{intent}_present?") }
  end

  def hello_present?
    include_string?(HELLO_INTENT)
  end

  def trash_present?
    include_string?(TRASH_INTENT)
  end

  private

  def include_string?(string_intent)
    hash_result = WitBot::Message.new.send(string)

    intent = hash_result['entities']['intent']

    return unless intent

    intent[0].values_at('value')[0] == string_intent
  end
end
