# frozen_string_literal: true

module Facter
  class InternalFactManager
    def resolve_facts(searched_facts)
      searched_facts.select! { |searched_fact| %i[core legacy].include? searched_fact.type }
      resolve(searched_facts)
    end

    private

    def resolve(searched_facts)
      searched_facts.reject! { |elem| elem.fact_class.nil? }
      resolved_facts = searched_facts.map do |searched_fact|
        CoreFact.new(searched_fact).create
      end
      resolved_facts.flatten!
      FactAugmenter.augment_resolved_facts(searched_facts, resolved_facts)
    end
  end
end
