require_relative '../lib/node'

describe Node do
  let(:item_1) { Item.new(name: 'Item A', value: 1.1) }
  let(:item_2) { Item.new(name: 'Item B', value: 2.2) }
  let(:items) { [item_1, item_2] }

  let(:node) { Node.new(name: 'Node Name', items: items) }

  it { expect(node).to be_kind_of Node }
  it { expect(node.name).to eq 'Node Name' }
  it { expect(node.items.size).to be 2 }

  it { expect(node.items[0]).to be_kind_of Item }
  it { expect(node.items[1]).to be_kind_of Item }

  it { expect(node.items[0].name).to eq 'Item A' }
  it { expect(node.items[1].name).to eq 'Item B' }

  it { expect(node.items[0].value).to eq 1.1 }
  it { expect(node.items[1].value).to eq 2.2 }
end
