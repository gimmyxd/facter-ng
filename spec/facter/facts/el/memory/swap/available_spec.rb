# frozen_string_literal: true

describe Facts::El::Memory::Swap::Available do
  describe '#call_the_resolver' do
    it 'returns a fact' do
      expected_fact = double(Facter::ResolvedFact, name: 'memory.swap.available', value: '1.0 KiB')
      allow(Facter::Resolvers::Linux::Memory).to receive(:resolve).with(:swap_free).and_return(1024)
      allow(Facter::ResolvedFact).to receive(:new).with('memory.swap.available', '1.0 KiB').and_return(expected_fact)
      expect(Facter::BytesToHumanReadable).to receive(:convert).with(1024).and_return('1.0 KiB')

      fact = Facts::El::Memory::Swap::Available.new
      expect(fact.call_the_resolver).to eq(expected_fact)
    end
  end
end
