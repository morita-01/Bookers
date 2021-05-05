class BooksController < ApplicationController
  def index #一覧
    @books = Book.all
    @book = Book.new
  end

  def create #追加
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id),notice: 'Book was successfully created.'
    else
      @books = Book.all
      render("books/index")
    end
  end

  def show #詳細
    @book = Book.find(params[:id])
    
  end

  def edit #編集
    @book = Book.find(params[:id])
    
  end

  def update #更新
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path(book.id),notice: 'Book was successfully updated.'
    else
      @book = book
      render :edit
    end
  end

  def destroy #削除
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
