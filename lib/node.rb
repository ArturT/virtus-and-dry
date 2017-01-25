require 'virtus'
require 'dry-types'
require 'dry-struct'

module Types
  include Dry::Types.module
end

#class Item
  #include Virtus.value_object

  #values do
    #attribute :name, String
    #attribute :value, Float
  #end
#end

class Item < Dry::Struct
  constructor_type(:schema)

  attribute :name, Types::Strict::String
  attribute :value, Types::Strict::Float.optional
end

class Node
  include Virtus.model

  attribute :name, String
  attribute :items, Array[Item]
end
