# frozen_string_literal: true

module Facts
  module Macosx
    module Os
      module Macosx
        class Product
          FACT_NAME = 'os.macosx.product'

          def call_the_resolver
            fact_value = Facter::Resolvers::SwVers.resolve(:productname)

            Facter::ResolvedFact.new(FACT_NAME, fact_value)
          end
        end
      end
    end
  end
end
