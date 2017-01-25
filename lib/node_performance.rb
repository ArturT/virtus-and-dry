require_relative './node'

time_me = ->(proc) {
  start_time = Time.now.to_f
  proc.call()
  end_time = Time.now.to_f
  time_in_millis = ((end_time - start_time) * 1000).to_i
  puts time_in_millis
}


puts 'Init NodeWithVirtusValueObject with hash as items'
time_me.call -> {
  10000.times {
    NodeWithVirtusValueObject.new(name: 'Name', items: [{name: 'A', value: 1.1}])
  }
}

puts 'Init NodeWithVirtusValueObject with VirtusItem object as items'
time_me.call -> {
  10000.times {
    NodeWithVirtusValueObject.new(name: 'Name', items: [VirtusItem.new(name: 'A', value: 1.1)])
  }
}

puts '-'*20

puts 'Init NodeWithDryStruct with hash as items'
time_me.call -> {
  10000.times {
    NodeWithDryStruct.new(name: 'Name', items: [{name: 'A', value: 1.1}])
  }
}

puts 'Init NodeWithDryStruct with DryItem object as items'
time_me.call -> {
  10000.times {
    NodeWithDryStruct.new(name: 'Name', items: [DryItem.new(name: 'A', value: 1.1)])
  }
}
