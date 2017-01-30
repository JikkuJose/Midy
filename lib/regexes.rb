module Midy
  REGEX = {
    series_episode_number: /((?<prefix>e|E|Ep|x|\.|\s)(?<episode_number>\d\d?)([^\d]|\s)|(?<separator>\s|\.)\d(?<episode_number>\d\d)\k<separator>).*(?<format>srt|mkv|mov|mp4|avi|m4v|ogv)$/,
    series_season_number: /((\.|s|S|\[)(?<season_number>\d\d?\d?)(\.|e|E|x|,|\s))|(?<season_number>\d\d)x/
  }
end

