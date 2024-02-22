require 'rails_helper'

RSpec.describe BirdsService do
  describe '.compile_birds_info' do
    let!(:node) { Node.create! } 
    let!(:birds) { [Node.create!(parent: node), Node.create!(parent: node)] } 

    it 'compiles bird info for given node_ids' do
      result = BirdsService.compile_birds_info([node.id])
      expect(result.first[:bird_ids]).to match_array(birds.map(&:id))
    end
  end
end
