require "byebug"



class PolyTreeNode

  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    if self.parent !=node
      self.parent = node
    end

  end

end # end PolyTreeNode Class