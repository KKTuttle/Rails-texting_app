class ContactBooksController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show

    @contact_book = current_user.contact_books.find(params[:id])

  end

  def new
    current_user
    @contact_book = current_user.contact_books.new
  end

  def create
    @contact_book = current_user.contact_books.new(contact_book_params)
    if @contact_book.save
      flash[:notice]
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end
private
  def contact_book_params
    params.require(:contact_book).permit(:name)
  end

end
