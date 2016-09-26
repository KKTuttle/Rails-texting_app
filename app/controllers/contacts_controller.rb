class ContactsController < ApplicationController
  def show

  end

  def new
    @contact_book = ContactBook.find(params[:contact_book_id])
    @contact = @contact_book.contacts.new
  end

  def create
    @contact_book = ContactBook.find(params[:contact_book_id])
    @contact = @contact_book.contacts.new(contact_params)
    if @contact.save
      redirect_to root_path
    else
      render:new
    end
  end


  def edit
  end

  def update
  end

  def delete
  end
private
  def contact_params
    params.require(:contact).permit(:name, :phone)
  end
end
