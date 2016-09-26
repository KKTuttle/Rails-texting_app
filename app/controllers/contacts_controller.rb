class ContactsController < ApplicationController
  def show
    @contact_book = current_user.contact_books.find(params[:contact_book_id])
    @contact = @contact_book.contacts.find(params[:id])
    @msg = @contact.msgs.new
  end

  def new
    @contact_book = current_user.contact_books.find(params[:contact_book_id])
    @contact = @contact_book.contacts.new
  end

  def create
    @contact_book = current_user.contact_books.find(params[:contact_book_id])
    @contact = @contact_book.contacts.new(contact_params)
    if @contact.save
      redirect_to contact_book_path(@contact_book)
    else
      render:new
    end
  end


  def edit
  end

  def update
    @contact_book = current_user.contact_books.find(params[:contact_book_id])
    @contact = @contact_book.contacts.find(params[:id])
    if @contact.update(contact_params)
      redirect_to contact_book_contact_path(@contact_book, @contact)
    else
      render:edit
    end
  end

  def delete
  end
private
  def contact_params
    params.require(:contact).permit(:name, :phone)
  end
end
