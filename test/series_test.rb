require_relative './test_helper.rb'

module Midy
  class SeriesTest < Minitest::Test
    def example
      {
        standard: "S02E01- It's Time to Move On.mkv",
        three_digit: "quantico.206.hdtv-lol[ettv].mkv",
        square: "The Office [2.08] Performance Review.avi",
        squarex: "The Simpsons [2x21] Three Men and a Comic Book.avi",
      }
    end

    def episode_number(type)
      Series
        .new(file_name: example[type])
        .episode_number
    end

    def season_number(type)
      Series
        .new(file_name: example[type])
        .season_number
    end

    def test_sqaurex
      s = season_number(:squarex)
      e = episode_number(:squarex)
      assert_equal e, '21'
      assert_equal s, '02'
    end

    def test_sqaure
      s = season_number(:square)
      e = episode_number(:square)
      assert_equal e, '08'
      assert_equal s, '02'
    end

    def test_standard
      s = season_number(:standard)
      e = episode_number(:standard)
      assert_equal e, '01'
      assert_equal s, '02'
    end

    def test_three_digit
      s = season_number(:three_digit)
      e = episode_number(:three_digit)
      assert_equal e, '06'
      assert_equal s, '02'
    end
  end
end
