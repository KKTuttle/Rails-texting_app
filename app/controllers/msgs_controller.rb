class MsgsController < ApplicationController
  before_action :authenticate_user!


  def index

  end

  def new

  end

  def create
    @contact_book = current_user.contact_books.find(params[:contact_book_id])
    @contact = @contact_book.contacts.find(params[:contact_id])
    @msg = @contact.msgs.new(msg_params)
    @msg.phone = @contact.phone
    if @msg.save
      flash[:notice] = "Saved successfully"
    else
      flash[:danger] = "Failed to save"
    end
    contact_book_contact_path(@contact_book, @contact)
  end

  def destroy
  end

  private

  def msg_params
    params.require(:msg).permit(:body)
  end
end
