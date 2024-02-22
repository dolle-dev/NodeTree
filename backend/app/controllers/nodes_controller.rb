# frozen_string_literal: true

# NodesController
class NodesController < ApplicationController
  before_action :load_nodes_for_common_ancestor, only: :common_ancestor
  before_action :extract_ids_for_birds_lookup, only: :birds

  def common_ancestor
    data = NodesService.find_common_ancestor(first_node: @first_node, second_node: @second_node)
    render json: { data: data }
  end

  def birds
    data = BirdsService.compile_birds_info(@node_ids)
    render json: { data: data }
  end

  private
  
  def load_nodes_for_common_ancestor
    @first_node = Node.find(params[:a])
    @second_node = Node.find(params[:b])
  end

  def extract_ids_for_birds_lookup
    @node_ids = params[:ids].to_s.split(',').map(&:to_i).reject(&:zero?)
  end
end
