class BookController < ApplicationController
  def new
     @book = Book.new
 end

 def create
   book = Book.new (book_params)
   if book.save
   flash[:success] = "タスクを追加しました。"
   redirect_to book_path (book.id)
 else
   flash.now[:danger] = "登録に失敗しました。"
   render :new
 end
 end

  def index
    @book = Book.all

  end

  def show
    @book = Book.find (params[:id])
end

  def edit
    @book = Book.find (params[:id])
  end

  def update
    book = Book.find (params[:id])
   if book.update (book_params)
    flash[:success] = "タスクを修正しました。"
    redirect_to book_path (book.id)
　　else
     flash.now[:danger] = "更新に失敗しました。"
     render'book/edit'
   end

  end

  def destroy
    book = Book.find (params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end
end
