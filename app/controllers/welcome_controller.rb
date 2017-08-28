class WelcomeController < ApplicationController

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path
      flash[:notice] = "成功提交留言"
    else
      redirect_to root_path
      flash[:warning] = "请正确填写，内容不得为空"
    end
  end


  private

  def message_params
    params.require(:message).permit(:name, :telphone)
  end
end
