# frozen_string_literal: true

describe Facts::Debian::Memory::Swap::Total do
  describe '#call_the_resolver' do
    subject(:fact) { Facts::Debian::Memory::Swap::Total.new }

    let(:resolver_value) { 1024 }
    let(:value) { '1.0 Kib' }

    before do
      allow(Facter::Resolvers::Linux::Memory).to \
        receive(:resolve).with(:swap_total).and_return(resolver_value)
      allow(Facter::BytesToHumanReadable).to receive(:convert).with(resolver_value).and_return(value)
    end

    it 'calls Facter::Resolvers::Linux::Memory' do
      fact.call_the_resolver
      expect(Facter::Resolvers::Linux::Memory).to have_received(:resolve).with(:swap_total)
    end

    it 'returns a resolved fact' do
      expect(fact.call_the_resolver).to be_an_instance_of(Facter::ResolvedFact).and \
        have_attributes(name: 'memory.swap.total', value: value)
    end
  end
end
