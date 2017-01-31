require 'minitest/autorun'
require 'minitest/reporters'

require_relative '../lib/series.rb'

Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new({detailed_skip: false})
