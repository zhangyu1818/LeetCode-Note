//
//  112. 路径总和.swift
//
//
//  Created by ZhangYu on 2021/7/31.
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
class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let node = root else { return false }
        if node.left == nil && node.right == nil {
            return targetSum == node.val
        }
        return hasPathSum(node.left, targetSum - node.val) || hasPathSum(node.right, targetSum - node.val)
    }
}
