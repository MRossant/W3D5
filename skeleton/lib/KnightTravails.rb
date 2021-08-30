require 'byebug'
require_relative "00_tree_node.rb"

class KnightPathFinder 

  def self.valid_moves(pos) #[0,0]: [1,2] [2,1]
    valid_moves_array = []
    x,y = pos
    if (x+1) >0 && (x+1)<8 && (y+2)>0 && (y+2)<8
      valid_moves_array<< [x+1, y+2]
    end
    if (x+2) >0 && (x+2)<8 && (y+1)>0 && (y+1)<8
      valid_moves_array << [x+2, y+1]
    end
    if (x-2) >0 && (x-2)<8 && (y+1)>0 && (y+1)<8
      valid_moves_array << [x-2, y+1]
    end
    if (x-1) >0 && (x-1)<8 && (y+2)>0 && (y+2)<8
      valid_moves_array << [x-1, y+2]
    end
    if (x-1) >0 && (x-1)<8 && (y-2)>0 && (y-2)<8
      valid_moves_array << [x-1, y-2]
    end
    if (x-2) >0 && (x-2)<8 && (y-1)>0 && (y-1)<8
      valid_moves_array << [x-2, y-1]
    end
    if (x+2) >0 && (x+2)<8 && (y-1)>0 && (y-1)<8
      valid_moves_array << [x+2, y-1]
    end
    if (x+1) >0 && (x+1)<8 && (y-2)>0 && (y-2)<8
      valid_moves_array<< [x+1, y-2]
    end
    valid_moves_array
    
  end

  attr_reader :position, :root_node

  def initialize(position)
   
    @root_node = PolyTreeNode.new(position)
    @considered_positions = [position]

  end

  def build_move_tree
    arr = [@root_node]
    unless arr.empty?

      temp = arr.shift
      arr_pos = self.new_move_positions(temp.value)
      arr_pos.each do |pos|
        child = PolyTreeNode.new(pos)
        temp.add_child(child)
        arr << child
      end
      # self
    end
  end

  def new_move_positions(pos)
    possible_positions = KnightPathFinder.valid_moves(pos)
    # possible_positions << KnightPathFinder.new(pos)
    # moves_arr = KnightPathFinder.valid_moves(pos)
    # moves_arr.each do |pos_value|
    #   temp = KnightPathFinder.new(pos_value)
    #   possible_positions << temp
    # end
    possible_positions.each do |ele| 
      if @considered_positions.any?(ele)
        possible_positions.delete(ele)
      else
        @considered_positions << ele
      end
    end
    possible_positions 
  end


end #end KnightPathFinder
