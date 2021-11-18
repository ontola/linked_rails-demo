# frozen_string_literal: true

class ThingSerializer < ApplicationSerializer
  attribute :name, predicate: Vocab.schema.name
  attribute :text, predicate: Vocab.schema.text
end
