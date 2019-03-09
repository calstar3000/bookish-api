class BooksController < ApplicationController
    helper BooksHelper

    def index
        @MAX_COLUMNS = 12
        @COLOUR_CLASSES = ["is-primary", "is-link", "is-info", "is-success", "is-warning"]
        @books_per_row = 3 # you only need to change this to change the column layout
        @books = Book.all
    end

    def show
        @book = Book.find(params[:id])
    end

    def new
        @book = Book.new
    end

    def edit
        @book = Book.find(params[:id])
    end

    def create
        @book = Book.new(book_params)

        if @book.save
            redirect_to action: "index"
        else
            render "new"
        end
    end

    def update
        @book = Book.find(params[:id])

        if @book.update(book_params)
            redirect_to @book
        else
            render "edit"
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy

        redirect_to books_path
    end

    private

        def book_params
            params.require(:book).permit(:title, :author)
        end

end
