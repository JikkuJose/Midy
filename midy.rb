require_relative './lib/regexes.rb'
require_relative './lib/series.rb'

# def from_file(name)
#   File
#     .open("#{name}.list", 'r') { |f| f.read }
#     .encode('UTF-8', :invalid => :replace)
#     .split("\n")
# end
#
# def rename_command(file_name, episode_number, format)
#   "mv '#{file_name}' #{episode_number}.#{format}"
# end
#
# some = from_file(:all).shuffle[0..15]
#
# some.each do |f|
#   mm = f.match(REGEX)
#   p rename_command(f, mm[:episode_number], mm[:format]) if mm
# end
