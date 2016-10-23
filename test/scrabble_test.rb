gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_multiple_letters
    assert_equal 4, Scrabble.new.score("and")
  end

  def test_it_doesnt_care_about_case
    assert_equal 4, Scrabble.new.score("AND")
    assert_equal 4, Scrabble.new.score("And")
  end

  def test_it_can_compile_scores
    assert_equal 4, Scrabble.new.compile_scores([["a", 1], ["n", 1], ["d", 2]])
  end

  def test_it_can_score_each_letter_individually
    assert_equal ["X", 8], Scrabble.new.score_each_letter("x")
  end

  def test_it_can_ignore_symbols
    assert_equal 4, Scrabble.new.score("and.")
  end

  def test_it_can_ignore_numbers
    assert_equal 4, Scrabble.new.score("and1")
  end
end
