class Library

def initialize(books)
  @books = books
end

def get_all_books
  return @books
end

def get_singular_book(title, library)
  for book in library
   if book[:title] = title
     return book
   end
  end
end

def get_singular_book_rental_details(title, library)
  get_singular_book(title, library)[:rental_details]
end

def add_new_book(title, library)
  new_book = {
    title: title,
    rental_details: {
     student_name: "",
     date: ""
    }
  }
  return library << new_book
end


def change_rental_details(library, title, renter, due_date)
  get_singular_book_rental_details(title, library)[:student_name] = renter
  get_singular_book_rental_details(title, library)[:date] = due_date
end


end
