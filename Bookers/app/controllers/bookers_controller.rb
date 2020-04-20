class BookersController < ApplicationController
  def top
  end
  def books
    @book = Book.new
    @books = Book.all
  end

  def create
      # ストロングパラメーターを使用
      book = Book.new(book_params)
      # DBへ保存する
      if book.save
      #flashメッセージを設定
      flash[:success] = 'Book was successfully created.'
      # 詳細画面へリダイレクト
        redirect_to bookers_path(book.id)
      #保存できなかったら
      else
      #flashメッセージを設定
      flash[:danger] = 'Book was not created correctly'
      #一覧ページへリダイレクト
        render :new
      end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    #flashメッセージを設定
    flash[:success] = 'Book was successfully edited.'
    flash[:danger] = 'Book was not edited correctly.'
    #詳細画面へリダイレクト
    redirect_to bookers_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    #flashメッセージを設定
    flash[:success] = 'Book was successfully destroyed.'
    #トップ画面へリダイレクト
    redirect_to books_path
  end

  private
  def book_params
      params.require(:book).permit(:title, :body)
  end
end
