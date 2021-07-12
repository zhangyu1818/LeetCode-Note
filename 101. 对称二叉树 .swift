//
//  101. 对称二叉树 .swift
//
//
//  Created by ZhangYu on 2021/7/10.
//

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

// 由于需要p.left和q.right对比，所以递归函数需要接受2个不同的节点作为参数
// 递归的终止条件为p.val != q.val
class Solution {
    func isSame(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if let pNode = p, let qNode = q {
            return pNode.val == qNode.val && isSame(pNode.left, qNode.right) && isSame(pNode.right, qNode.left)
        } else {
            return p == nil && q == nil
        }
    }

    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isSame(root?.left, root?.right)
    }
}
