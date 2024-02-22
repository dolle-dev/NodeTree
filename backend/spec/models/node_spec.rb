require 'rails_helper'

RSpec.describe Node, type: :model do
  describe "#ancestors" do
    it "returns the correct ancestors array" do
      parent_node = Node.create!
      child_node = Node.create!(parent: parent_node)
      expect(child_node.ancestors).to eq([child_node.id, parent_node.id])
    end
  end
end
