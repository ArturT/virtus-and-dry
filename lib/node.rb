require 'virtus'
require 'dry-types'
require 'dry-struct'

class VirtusItem
  include Virtus.value_object

  values do
    attribute :name, String
    attribute :value, Float
  end
end

class NodeWithVirtusValueObject
  include Virtus.model

  attribute :name, String
  attribute :items, Array[VirtusItem]
end


# Virtus & Dry example

module Types
  include Dry::Types.module
end

class DryItem < Dry::Struct
  constructor_type(:schema)

  attribute :name, Types::Strict::String
  attribute :value, Types::Strict::Float.optional
end

class NodeWithDryStruct
  include Virtus.model

  attribute :name, String
  attribute :items, Array[DryItem]
end
