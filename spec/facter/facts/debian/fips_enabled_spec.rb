# frozen_string_literal: true

describe Facter::Debian::FipsEnabled do
  describe '#call_the_resolver' do
    let(:value) { false }

    it 'returns a fact' do
      expected_fact = double(Facter::ResolvedFact, name: 'fips_enabled', value: value)
      allow(Facter::Resolvers::Linux::FipsEnabled).to receive(:resolve).with(:fips_enabled).and_return(value)
      allow(Facter::ResolvedFact).to receive(:new).with('fips_enabled', value).and_return(expected_fact)

      fact = Facter::Debian::FipsEnabled.new
      expect(fact.call_the_resolver).to eq(expected_fact)
    end
  end
end
