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
      file_name.match(REGEX[:series_episode_number])[:episode_number]
    end

    def season_number
      file_name.match(REGEX[:series_season_number])[:season_number]
    end

    def title
      'No name'
    end
  end
end
