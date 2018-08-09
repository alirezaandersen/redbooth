# Consider a binary tree where each node contains an integer value and a
# reference to its left and right children:
#
#                        12                => 12 = 12
#                       /  \
#                      /    \
#                     6      3             => 6 + 3 = 9
#                    /      / \
#                   /      /   \
#                  2      4     1          => 2 + 4 + 1 = 7
#                   \          /
#                    \        /
#                     1      4             => 1 + 4 = 5
#
# You are given a class (TreeLevelSummer) which can compute these
# sums and print them. See the code below.
#
# Your task:
#   Make any modifications to the existing code that you need to
#   so that you can also write a rails controller method which responds
#   with a JSON representation of the sum at each level of
#   TreeLevelSummer.example_tree. For example:
#     {
#       0: 12,
#       1: 9,
#       2: 7,
#       3: 5
#     }
#
#   In addition, your controller method should accept a URL param "levels"
#   That takes a list of integers. If that param is present, your controller
#   method should only include the sum at the particular levels indicated.


#controller

class TreeLevelSummerController < ApplicationController

  def show()
    TreeLevelSummer.new(example_tree).sum(params[:levels])
  end


  private

  def example_tree
    root = TreeNode.new(12)
    root.left = TreeNode.new(6)
    root.left.left = TreeNode.new(2)
    root.left.left.right = TreeNode.new(1)
    root.right = TreeNode.new(3)
    root.right.left = TreeNode.new(4)
    root.right.right = TreeNode.new(1)
    root.right.right.left = TreeNode.new(4)
  end

end

# TreeLevelSummer
class TreeLevelSummer
  def initialize(root)
    @root = root
    @level_sums = Hash.new 0
  end

  # prints the sum of the nodes at each level
  def sum(level = nil)
    sum_from_node @root
		# [0,3] return 12, 5
    if level.nil?
      @level_sums
    else
      @level_sums.slice(level)
    end
  end

  private

  # implementation of the recursive, depth-first traversal
  def sum_from_node(node, current_level: 0)
    return unless node

    @level_sums[current_level] += node.value

    sum_from_node node.left, current_level: current_level + 1
    sum_from_node node.right, current_level: current_level + 1
  end

  class TreeNode
    def initialize(value)
      @value = value
    end

    attr_accessor :left, :right

    attr_reader :value
  end
end
