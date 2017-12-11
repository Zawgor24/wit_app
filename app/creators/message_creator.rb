# This class gets output params from IntentRecognition and create message
class MessageCreator
  attr_accessor :params, :user

  def initialize(params, user)
    self.params = params
    self.user = user
  end

  def call
    params[:output] = IntentRecognition.new(params[:input]).intent

    user.messages.create(params)
  end
end
