require 'virtus'

class Item
  include Virtus.value_object

  values do
    attribute :name, String
    attribute :value, Float
  end
end

class Node
  include Virtus.model

  attribute :name, String
  attribute :items, Array[Item]
end
