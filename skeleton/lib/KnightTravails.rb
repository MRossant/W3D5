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
    # debugger
    until arr.empty?
      # debugger
      temp = arr.shift
      # debugger
      arr_pos = self.new_move_positions(temp.value)
      arr_pos.each do |pos|
        # debugger
        child = PolyTreeNode.new(pos)
        # debugger
        temp.add_child(child)
        arr << child
        # debugger
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
      # debugger
      if @considered_positions.include?(ele)
        # debugger
        possible_positions.delete(ele)
      else
        @considered_positions << ele
      end
    end
    # debugger
    possible_positions 
  end

#-----------------End Part 1-------------------


  def find_path(end_pos)
    # debugger
    @root_node.dfs(end_pos)
    # return @root_node if @root_node.value == end_pos 
    # search_node = @root_node.
    # return nil if @root_node.children.empty?

    # self.root_node.children.each do |child|
    #   temp = child.find_path(end_pos)
    #   return temp if temp != nil
    # end
    
    # return nil
  end

  def trace_path_back

  end


end #end KnightPathFinder
