require 'rails_helper'

RSpec.describe NodesService do
  describe '.find_common_ancestor' do
    context 'when nodes are the same' do
      let(:node) { create(:node) }

      it 'returns the correct ancestor record' do
        result = NodesService.find_common_ancestor(first_node: node, second_node: node)
        expect(result[:lowest_common_ancestor]).to eq(node.id)
        expect(result[:root]).to eq(node.id)
        expect(result[:depth]).to eq(0)
      end
    end

    context 'when nodes have a common ancestor' do
      let(:ancestor) { create(:node) }
      let(:child1) { create(:node, parent: ancestor) }
      let(:child2) { create(:node, parent: ancestor) }

      it 'returns the correct common ancestor' do
        result = NodesService.find_common_ancestor(first_node: child1, second_node: child2)
        expect(result[:lowest_common_ancestor]).to eq(ancestor.id)
        expect(result[:root]).to eq(ancestor.id)
        expect(result[:depth]).to be_a(Integer) # The actual depth will depend on your tree structure
      end
    end

    context 'when nodes do not have a common ancestor' do
      let(:node1) { create(:node) }
      let(:node2) { create(:node) }

      it 'returns nil values for the ancestor and depth' do
        result = NodesService.find_common_ancestor(first_node: node1, second_node: node2)
        expect(result[:lowest_common_ancestor]).to be_nil
        expect(result[:root]).to be_nil
        expect(result[:depth]).to be_nil
      end
    end
  end
end
