# frozen_string_literal: true

describe Facts::Sles::Memory::Swap::Available do
  describe '#call_the_resolver' do
    let(:value) { '1.00 KiB' }

    it 'returns a fact' do
      expected_fact = double(Facter::ResolvedFact, name: 'memory.swap.available', value: value)
      allow(Facter::Resolvers::Linux::Memory).to receive(:resolve).with(:swap_free).and_return(1024)
      allow(Facter::ResolvedFact).to receive(:new).with('memory.swap.available', value).and_return(expected_fact)

      fact = Facts::Sles::Memory::Swap::Available.new
      expect(Facter::BytesToHumanReadable.convert(1024)).to eq(value)
      expect(fact.call_the_resolver).to eq(expected_fact)
    end
  end
end
