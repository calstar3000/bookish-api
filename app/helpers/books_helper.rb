module BooksHelper
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
