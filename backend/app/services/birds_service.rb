# frozen_string_literal: true

# birds_service.rb
class BirdsService
  def self.compile_birds_info(node_ids)
    Node.includes(:birds).where(id: node_ids).map {|node| { node_id: node.id, bird_ids: node.birds.pluck(:id) }}
  end
end
