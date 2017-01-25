require_relative '../lib/node'

shared_examples_for 'node' do
  let(:item_1) { item_class.new(name: 'Item A', value: 1.1) }
  # missing value to ensure the value is optional
  let(:item_2) { item_class.new(name: 'Item B') }
  let(:items) { [item_1, item_2] }

  let(:node) do
    node_class.new(
      name: 'Node Name',
      # we pass hash here for items to ensure it will be coerced
      items: items.map(&:to_h)
    )
  end

  it { expect(node).to be_kind_of node_class }
  it { expect(node.name).to eq 'Node Name' }
  it { expect(node.items.size).to be 2 }

  it { expect(node.items[0]).to be_kind_of item_class }
  it { expect(node.items[1]).to be_kind_of item_class }

  it { expect(node.items[0].name).to eq 'Item A' }
  it { expect(node.items[1].name).to eq 'Item B' }

  it { expect(node.items[0].value).to eq 1.1 }
  it { expect(node.items[1].value).to be_nil }
end

describe 'Node' do
  context 'when virtus model with value objects in items' do
    let(:node_class) { NodeWithVirtusValueObject }
    let(:item_class) { VirtusItem }

    it_behaves_like 'node'
  end

  context 'when virtus model with dry struct in items' do
    let(:node_class) { NodeWithDryStruct }
    let(:item_class) { DryItem }

    it_behaves_like 'node'
  end
end
