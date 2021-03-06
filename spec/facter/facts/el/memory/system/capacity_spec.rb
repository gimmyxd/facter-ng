# frozen_string_literal: true

describe Facts::El::Memory::System::Capacity do
  describe '#call_the_resolver' do
    it 'returns a fact' do
      expected_fact = double(Facter::ResolvedFact, name: 'memory.system.capacity', value: 1024)
      allow(Facter::Resolvers::Linux::Memory).to receive(:resolve).with(:capacity).and_return(1024)
      allow(Facter::ResolvedFact).to receive(:new).with('memory.system.capacity', 1024).and_return(expected_fact)

      fact = Facts::El::Memory::System::Capacity.new
      expect(fact.call_the_resolver).to eq(expected_fact)
    end
  end
end
