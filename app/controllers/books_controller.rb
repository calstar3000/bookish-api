class BooksController < ApplicationController
    helper_method :tile_column_class, :tile_colour_class, :is_start_of_row, :is_end_of_row

    def new
    end

    def index
        @MAX_COLUMNS = 12
        @COLOUR_CLASSES = [
            "is-primary",
            "is-link",
            "is-info",
            "is-success",
            "is-warning",
            "is-danger"
        ]
        @books_per_row = 3 # you only need to change this to change the column layout

        @books = Book.all
    end

    def tile_column_class(max_columns, books_per_row)
        "is-#{ max_columns / books_per_row }"
    end

    def tile_colour_class(index, colour_classes)
        colour_classes[index % colour_classes.length]
    end

    def is_start_of_row(index, books_per_row)
        index % books_per_row == 0
    end

    def is_end_of_row(index, books_per_row, total_books)
        (index + 1) % books_per_row == 0 or index == total_books
    end

    def show
        @book = Book.find(params[:id])
    end

    def create
        @book = Book.new(book_params)
        @book.save

        redirect_to action: "index"
    end

    private

        def book_params
            params.require(:book).permit(:title, :author)
        end

end
