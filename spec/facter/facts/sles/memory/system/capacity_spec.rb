# frozen_string_literal: true

describe Facts::Sles::Memory::System::Capacity do
  describe '#call_the_resolver' do
    it 'returns a fact' do
      expected_fact = double(Facter::ResolvedFact, name: 'memory.system.capacity', value: '21.50%')
      allow(Facter::Resolvers::Linux::Memory).to receive(:resolve).with(:capacity).and_return('21.50%')
      allow(Facter::ResolvedFact).to receive(:new).with('memory.system.capacity', '21.50%').and_return(expected_fact)

      fact = Facts::Sles::Memory::System::Capacity.new
      expect(fact.call_the_resolver).to eq(expected_fact)
    end
  end
end
