# frozen_string_literal: true

# Node Model
class Node < ApplicationRecord
  belongs_to :parent, class_name: 'Node', optional: true
  has_many :birds, class_name: 'Node', foreign_key: 'parent_id', dependent: :destroy

  def ancestors
    current_node = self
    ancestors = [current_node.id]
    while current_node.parent && current_node.parent != current_node
      current_node = current_node.parent
      ancestors << current_node.id
    end
    ancestors
  end
end

