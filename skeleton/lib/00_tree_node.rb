require "byebug"

class PolyTreeNode

  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(parent_node)
    if self.parent != nil
      self.parent.children.delete(self)
    end

    if parent_node != nil
      @parent = parent_node
      parent_node.children << self
    else
      @parent = nil
    end
  end

end # end PolyTreeNode Class

# poly = PolyTreeNode.new(2)
# father = PolyTreeNode.new(5)
# poly.parent=(father)