# Message class - show, and create new messages from user
# and redirect to user's messages with answears from wit.ai
class MessagesController < ApplicationController
  def index
    @messages = current_user.messages
  end

  def new
    @message = Message.new
  end

  def create
    @message = MessageCreator.new(message_params, current_user).call

    redirect_to user_messages_path(current_user)
  end

  private

  def message_params
    params.require(:message).permit(:input)
  end
end
