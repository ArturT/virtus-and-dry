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

class ArrayDryItem < Virtus::Attribute
  def coerce(value)
    case value
    when Array
      value.map do |item|
        coerce_item(item)
      end
    when nil, {}
      []
    else
      raise "Unknow value type: #{value.inspect}"
    end
  end

  private

  def coerce_item(value)
    case value.class.to_s
    when 'Hash'
      DryItem.new(value)
    when 'DryItem'
      value
    else
      raise "Unknow value type: #{value.inspect}"
    end
  end
end

class DryItemAttr < Virtus::Attribute
  def coerce(value)
    case value
    when Hash
      DryItem.new(value)
    when DryItem
      value
    else
      raise "Unknow value type: #{value.inspect}"
    end
  end
end

class NodeWithDryStruct
  include Virtus.model

  attribute :name, String
  #attribute :items, Array[DryItemAttr]
  attribute :items, ArrayDryItem
end
