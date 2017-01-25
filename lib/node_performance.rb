require_relative './node'

time_me = ->(proc) {
  start_time = Time.now.to_f
  proc.call()
  end_time = Time.now.to_f
  time_in_millis = ((end_time - start_time) * 1000).to_i
  puts time_in_millis
}

NODE_CREATE_LIMIT = 10_000
HASH_ITEMS_LIMIT = 100
NODE_WITH_MANY_ITEMS_CREATE_LIMIT = 100


hash_items = []
HASH_ITEMS_LIMIT.times { hash_items << {name: 'A', value: 1.1} }


puts 'Init NodeWithVirtusValueObject with hash as items'
time_me.call -> {
  NODE_CREATE_LIMIT.times {
    NodeWithVirtusValueObject.new(name: 'Name', items: [{name: 'A', value: 1.1}])
  }
}

puts 'Init NodeWithVirtusValueObject with VirtusItem object as items'
time_me.call -> {
  NODE_CREATE_LIMIT.times {
    NodeWithVirtusValueObject.new(name: 'Name', items: [VirtusItem.new(name: 'A', value: 1.1)])
  }
}

puts 'Init NodeWithVirtusValueObject with many hash as items'
time_me.call -> {
  NODE_WITH_MANY_ITEMS_CREATE_LIMIT.times {
    NodeWithVirtusValueObject.new(name: 'Name', items: hash_items)
  }
}

puts '-'*20

puts 'Init NodeWithDryStruct with hash as items'
time_me.call -> {
  NODE_CREATE_LIMIT.times {
    NodeWithDryStruct.new(name: 'Name', items: [{name: 'A', value: 1.1}])
  }
}

puts 'Init NodeWithDryStruct with DryItem object as items'
time_me.call -> {
  NODE_CREATE_LIMIT.times {
    NodeWithDryStruct.new(name: 'Name', items: [DryItem.new(name: 'A', value: 1.1)])
  }
}

puts 'Init NodeWithDryStruct with many hash as items'
time_me.call -> {
  NODE_WITH_MANY_ITEMS_CREATE_LIMIT.times {
    NodeWithDryStruct.new(name: 'Name', items: hash_items)
  }
}
