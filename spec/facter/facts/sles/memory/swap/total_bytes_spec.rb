# frozen_string_literal: true

describe Facts::Sles::Memory::Swap::TotalBytes do
  describe '#call_the_resolver' do
    it 'returns a fact' do
      expected_fact = double(Facter::ResolvedFact, name: 'memory.swap.total_bytes', value: 1024)
      allow(Facter::Resolvers::Linux::Memory).to receive(:resolve).with(:swap_total).and_return(1024)
      allow(Facter::ResolvedFact).to receive(:new).with('memory.swap.total_bytes', 1024).and_return(expected_fact)

      fact = Facts::Sles::Memory::Swap::TotalBytes.new
      expect(fact.call_the_resolver).to eq(expected_fact)
    end
  end
end
