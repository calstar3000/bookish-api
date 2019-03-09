class BooksController < ApplicationController
    helper_method :tile_column_class, :tile_colour_class, :is_start_of_row, :is_end_of_row

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

        # View helper methods

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

end
