require_relative './regexes.rb'

module Midy
  class Series
    attr_reader :file_name

    def initialize(file_name:)
      @file_name = file_name
    end

    def meta
      {
        episode_number: episode_number,
        season_number: season_number,
        title: title,
      }
    end

    def episode_number
      match_result = file_name.match(REGEX[:series_episode_number])
      return nil unless match_result

      e = match_result[:episode_number]
      e.length == 2 ? e : "0#{e}"
    end

    def season_number
      match_result = file_name.match(REGEX[:series_season_number])
      return nil unless match_result

      s = match_result[:season_number]

      case s.length
      when 1
        "0#{s}"
      when 2
        s
      when 3
        "0#{s[0]}"
      end
    end

    def title
      'No name'
    end
  end
end
