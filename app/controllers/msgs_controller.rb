class MsgsController < ApplicationController
  before_action :authenticate_user!

  def index
    
  end

  def new

  end

  def create
  end

  def destroy
  end

  private

  def msg_params
    params.require(:msg).permit(:body)
  end
end
