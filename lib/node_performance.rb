require_relative './node'

time_me = ->(proc) {
  start_time = Time.now.to_f
  proc.call()
  end_time = Time.now.to_f
  time_in_millis = ((end_time - start_time) * 1000).to_i
  puts time_in_millis
}

puts 'Init Node with hash as items'
time_me.call -> {
  10000.times {
    Node.new(name: 'Name', items: [{name: 'A', value: 1.1}])
  }
}

puts 'Init Node with Item object as items'
time_me.call -> {
  10000.times {
    Node.new(name: 'Name', items: [Item.new(name: 'A', value: 1.1)])
  }
}
