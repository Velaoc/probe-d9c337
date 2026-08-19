class GuestbookController < ApplicationController
  def index
    @messages = Message.wall
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path, notice: "Thanks — your note is on the wall."
    else
      @messages = Message.wall
      render :index, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:author_name, :body)
  end
end
