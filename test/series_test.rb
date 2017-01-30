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

    def random
      [
        {
          name: "hawaii.five-0.2010.713.hdtv-lol[ettv].mkv",
          e: '13',
          s: '07',
        },
      ]
    end

    def test_random_one
      sample = random[0]
      f = sample[:name]
      e_expected = sample[:e]
      s_expected = sample[:s]

      e = episode_number(f)
      s = season_number(f)

      assert_equal e_expected, e
      assert_equal s_expected, s
    end

    def episode_number(file_name)
      Series
        .new(file_name: file_name)
        .episode_number
    end

    def season_number(file_name)
      Series
        .new(file_name: file_name)
        .season_number
    end

    def test_sqaurex
      s = season_number(example[:squarex])
      e = episode_number(example[:squarex])
      assert_equal e, '21'
      assert_equal s, '02'
    end

    def test_sqaure
      s = season_number(example[:square])
      e = episode_number(example[:square])
      assert_equal e, '08'
      assert_equal s, '02'
    end

    def test_standard
      s = season_number(example[:standard])
      e = episode_number(example[:standard])
      assert_equal e, '01'
      assert_equal s, '02'
    end

    def test_three_digit
      s = season_number(example[:three_digit])
      e = episode_number(example[:three_digit])
      assert_equal e, '06'
      assert_equal s, '02'
    end
  end
end
