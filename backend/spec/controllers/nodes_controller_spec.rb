require 'rails_helper'

RSpec.describe NodesController, type: :controller do
  describe 'GET #common_ancestor' do
    let!(:first_node) { create(:node) }
    let!(:second_node) { create(:node) }

    context 'when nodes are present' do
      before do
        allow(NodesService).to receive(:find_common_ancestor).and_return({})
        get :common_ancestor, params: { a: first_node.id, b: second_node.id }
      end

      it 'returns a success response' do
        expect(response).to have_http_status(:success)
      end

      it 'calls the NodesService with correct parameters' do
        expect(NodesService).to have_received(:find_common_ancestor).with(first_node: first_node, second_node: second_node)
      end
    end

    context 'when a node is missing' do
      it 'raises a RecordNotFound error for first_node' do
        expect {
          get :common_ancestor, params: { a: 0, b: second_node.id }
        }.to raise_error(ActiveRecord::RecordNotFound)
      end

      it 'raises a RecordNotFound error for second_node' do
        expect {
          get :common_ancestor, params: { a: first_node.id, b: 0 }
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'GET #birds' do
    let!(:node) { create(:node) }
    let!(:birds) { create_list(:node, 2, parent: node) } # Assuming Node can be a bird and has a parent association

    context 'with valid node_ids' do
      before do
        get :birds, params: { ids: node.id.to_s }
      end

      it 'returns a success response' do
        expect(response).to have_http_status(:success)
      end

      it 'returns the correct data' do
        data = JSON.parse(response.body)["data"]
        expect(data.first["node_id"]).to eq(node.id)
        expect(data.first["bird_ids"]).to match_array(birds.map(&:id))
      end
    end

    context 'with invalid node_ids' do
      it 'returns an empty array when node_ids do not exist' do
        get :birds, params: { ids: '0' }
        data = JSON.parse(response.body)["data"]
        expect(data).to be_empty
      end
    end
  end
end
