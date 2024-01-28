class BooksController < ApplicationController
  def index
    @books = Book.order(:author)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new(price: 0)
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render('new')
    end
  end


  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render('edit')
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(
      :title,
      :author,
      :price,
      :published_date
    )
  end
end
