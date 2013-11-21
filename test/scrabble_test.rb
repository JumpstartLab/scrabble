Bundler.require
require './lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'

class ScrabbleTest < MiniTest::Unit::TestCase
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.score("a")
    assert_equal 4, Scrabble.score("f")
  end

  def test_it_scores_a_word
    assert_equal 8, Scrabble.score("hello")
  end

  def test_it_scores_nil_as_zero
    assert_equal 0, Scrabble.score(nil)
  end

  def test_it_scores_empty_string_as_zero
    assert_equal 0, Scrabble.score("")
  end

  def test_it_picks_the_higest_scoring_word_from_a_list_of_one
    assert_equal "home", Scrabble.highest_score_from(['home'])
  end

  def test_it_picks_the_higest_scoring_word_from_a_list_of_two
    assert_equal "home", Scrabble.highest_score_from(['home', 'word'])
  end

  def test_it_picks_the_higest_scoring_word_from_a_list_of_four
    assert_equal "home", Scrabble.highest_score_from(['home', 'word', 'hello', 'sound'])
  end

  def test_it_picks_the_shortest_high_scoring_word_from_a_list
    assert_equal "word", Scrabble.highest_score_from(['hello', 'word', 'sound'])
  end

  def test_it_picks_the_bonus_word_from_the_highscoring_set
    assert_equal "silence", Scrabble.highest_score_from(['home', 'word', 'silence'])
  end

  def test_it_picks_the_first_word_when_theres_no_more_clear_choice
    assert_equal "word", Scrabble.highest_score_from(['hi', 'word', 'ward'])
  end
end