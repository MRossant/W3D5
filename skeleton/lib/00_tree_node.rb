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

  def add_child(child_node)
    child_node.parent=self
  end

  def remove_child(child_node)
    raise error if child_node.parent == nil
    child_node.parent=nil
  end

  def dfs(target_value)
    return self if self.value == target_value
    return nil if self.children.empty? 

    self.children.each do |child|
      # return child if child.value == target_value
      temp = child.dfs(target_value)
      return temp if temp != nil
    end

    nil
  end

end # end PolyTreeNode Class

#child2, child1, @parent=nil 

# poly = PolyTreeNode.new(2)
# father = PolyTreeNode.new(5)
# poly.parent=(father)

# base case
    # root_node.val == target_value, return root_node
    # no children => return nil
  # inductive case
    # search children of root_node for the target_value
    # iterate over children of node received as arg 
      # call dfs on child, passing in the child and target_value
        # store return value of this call in a variable
          # nil => continue the search
          # node => we found our node, return it! => stops the search
    # return nil
      # we searched the whole tree but didn't find target_value