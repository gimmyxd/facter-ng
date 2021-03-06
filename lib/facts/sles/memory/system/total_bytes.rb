# frozen_string_literal: true

module Facts
  module Sles
    module Memory
      module System
        class TotalBytes
          FACT_NAME = 'memory.system.total_bytes'

          def call_the_resolver
            fact_value = Facter::Resolvers::Linux::Memory.resolve(:total)
            Facter::ResolvedFact.new(FACT_NAME, fact_value)
          end
        end
      end
    end
  end
end
