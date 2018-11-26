require('minitest/autorun')
require('minitest/rg')
require_relative('../library.rb')

class TestLibrary < MiniTest::Test

def setup

  @new_book = {
    title: "the_epic_of_gilgamesh",
    rental_details: {
     student_name: "",
     date: ""
    }
  }

  @library = [
    {
    title: "lord_of_the_rings",
    rental_details: {
     student_name: "Jeff",
     date: "01/12/18"
    }
  },
  {
    title: "the_silmarillion",
    rental_details: {
     student_name: "Nat",
     date: "22/09/18"
    }
  },
  {
    title: "arabian_nights",
    rental_details: {
     student_name: "Lori",
     date: "04/06/18"
    }
  }
]

  @book1 = {
    title: "lord_of_the_rings",
    rental_details: {
    student_name: "Jeff",
    date: "01/12/18"
    }
    }

  @book2 = {
      title: "lord_of_the_rings",
      rental_details: {
      student_name: "Emma",
      date: "01/12/18"
      }
      }

end



def test_get_all_books
  books = Library.new(@library)
  result = books.get_all_books
  assert_equal(@library, result)
end

def test_get_singular_book
  books = Library.new(@library)
  result = books.get_singular_book(@book1[:title], @library)
  assert_equal(@book1, result)
end

def test_get_singular_book_rental_details
  books = Library.new(@library)
  result = books.get_singular_book_rental_details(@book1[:title], @library)
  assert_equal(@book1[:rental_details], result)
end


def test_add_new_book
  books = Library.new(@library)
  result = books.add_new_book(@new_book[:title], @library).include?(@new_book)
  assert_equal(true, result)
end

def test_change_rental_details
  books = Library.new(@library)
  result = books.change_rental_details(@library, @book2[:title], @book2[:rental_details][:student_name], @book2[:rental_details][:date])
  assert_equal(@book2[:rental_details], @library[0][:rental_details])
end

end
