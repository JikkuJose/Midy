require_relative './test_helper.rb'

module Midy
  class SeriesTest < Minitest::Test
    def examples
      [
        { name: "hawaii.five-0.2010.713.hdtv-lol[ettv].mkv", e: '13', s: '07' },
        { name: "quantico.206.hdtv-lol[ettv].mkv", e: '06' , s: '02'  },
        { name: "S02E01- It's Time to Move On.mkv", e: '01', s: '02' },
        { name: 'the.flash.2014.306.hdtv-lol[ettv].mkv', e: '06', s: '03' },
        { name: 'The Office [2.08] Performance Review.avi', e: '08', s: '02' },
        { name: 'The Simpsons [2x21] Three Men and a Comic Book.avi', e: '21', s: '02' },
        { name: 'Torrent-Downloaded-from-ExtraTorrent.cc.txt', e: nil, s: nil },
        { name: 'Sherlock S4, Ep2-The Lying Detective.mkv', s: '04', e: '02' }
      ]
    end

    def test_examples
      examples.each do |sample|
        f = sample[:name]
        e_expected = sample[:e]
        s_expected = sample[:s]

        e = episode_number(f)
        s = season_number(f)

        assert_equal e_expected, e, "Wrong episode for: #{f}"
        assert_equal s_expected, s, "Wrong season for: #{f}"
      end
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
  end
end
