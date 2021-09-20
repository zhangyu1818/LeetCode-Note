/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var map = [Int: Int]()
        for (index, value) in inorder.enumerated() {
            map[value] = index
        }
        func helper(_ preorderStart: Int, _ preorderEnd: Int, _ inorderStart: Int, _ inorderEnd: Int) -> TreeNode? {
            if preorderStart > preorderEnd { return nil }
            let rootValue = preorder[preorderStart]
            let rootValueInorderIndex = map[rootValue]!

            var node = TreeNode(rootValue)
            // rootValueInorderIndex - inorderStart =》 根结点在中序数组中的索引减去中序数组开始的索引等于当前树的左子树个数
            node.left = helper(preorderStart + 1, preorderStart + rootValueInorderIndex - inorderStart, inorderStart, rootValueInorderIndex - 1)
            node.right = helper(preorderStart + 1 + rootValueInorderIndex - inorderStart, preorderEnd, rootValueInorderIndex + 1, inorderEnd)
            return node
        }
        return helper(0, preorder.count - 1, 0, inorder.count - 1)
    }
}
