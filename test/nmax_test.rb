require "./test_helper"
require "../lib/nmax"

class NmaxTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Nmax::VERSION
  end

  def test_it_does_something_useful
    array_size = 3

    text_1 = "0 1 2 3 4 5 6 7 8 9"
    assert_equal [9,8,7], Nmax.nmax_text(text_1, array_size)
    assert_equal [], Nmax.nmax_text(text_1, 0)

    text_2 = File.open("MaoLittleRedBook.txt", "r")
    assert_equal [2001,1966,1964], Nmax.nmax_text(text_2, array_size)
    text_2.close

    text_3 = "321 123 02 \n 1999 1 2"
    assert_equal [1999,321,123], Nmax.nmax_text(text_3, array_size)

    text_4 = "\n 1000.2321 kg"
    assert_equal [2321,1000], Nmax.nmax_text(text_4, array_size)

  end
end
