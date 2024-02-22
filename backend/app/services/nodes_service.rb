# frozen_string_literal: true

# node_service.rb
class NodesService
  def self.find_common_ancestor(first_node:, second_node:)
    return same_node_ancestors_records(first_node) if first_node == second_node

    first_node_ancestors = first_node.ancestors
    second_node_ancestors = second_node.ancestors

    lowest_common_ancestor = lowest_common_ancestor(first_node_ancestors:, second_node_ancestors:)

    return { root: nil, lowest_common_ancestor: nil, depth: nil } if lowest_common_ancestor.nil?

    root = first_node_ancestors.last
    depth = first_node_ancestors.index(root) - first_node_ancestors.index(lowest_common_ancestor)

    { root: root, lowest_common_ancestor: lowest_common_ancestor, depth: depth }
  end
  
  private

  def self.same_node_ancestors_records(node)
    node_ancestors = node.ancestors
    lowest_common_ancestor = node.id
    root = node_ancestors.last
    depth = (node_ancestors.index(root) - node_ancestors.index(lowest_common_ancestor))

    { root: root, lowest_common_ancestor: lowest_common_ancestor, depth: depth }
  end

  def self.lowest_common_ancestor(first_node_ancestors:, second_node_ancestors:)
    (first_node_ancestors & second_node_ancestors).first
  end
end
