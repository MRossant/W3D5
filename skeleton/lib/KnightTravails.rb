require_relative "00_tree_node.rb"

class KnightPathFinder 

  def self.valid_moves(pos)
  end

  def initialize(position)
    @root_node = PolyTreeNode.new(position)
    @considered_positions = [position]

  end

  def build_move_tree
    
  end

  def new_move_positions(pos)
    possible_positions = KnightPathFinder.valid_moves(pos)
    possible_positions.each {|ele| @considered_positions << ele if @considered_positions.none?(ele)}
  end


end #end KnightPathFinder
