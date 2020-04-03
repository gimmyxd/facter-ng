# frozen_string_literal: true

require 'ruby-prof'
require 'facter'

RubyProf.measure_mode = RubyProf::WALL_TIME
profile = RubyProf::Profile.new
profile.start
Facter.to_hash
result = profile.stop
printer = RubyProf::MultiPrinter.new(result)
printer.print(path: '.', profile: 'profile', min_percent: 0.1)
