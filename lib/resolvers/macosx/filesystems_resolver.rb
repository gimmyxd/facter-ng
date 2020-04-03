# frozen_string_literal: true

module Facter
  module Resolvers
    module Macosx
      class Filesystems < BaseResolver
        # :macosx_filesystems

        @fact_list ||= {}
        @log = Facter::Log.new(self)

        class << self
          private

          def post_resolve(fact_name)
            @fact_list.fetch(fact_name) { read_filesystems(fact_name) }
          end

          def read_filesystems(fact_name)
            output, _status = Open3.capture2('mount')
            filesystems = []
            output.each_line do |line|
              filesystem = line.match(/\(([a-z]+)\,*/).to_s
              filesystems << filesystem[1..-2]
            end
            @fact_list[:macosx_filesystems] = filesystems.uniq.sort.join(',')
            @fact_list[fact_name]
          end
        end
      end
    end
  end
end
