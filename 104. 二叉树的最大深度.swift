//
//  104. 二叉树的最大深度.swift
//
//
//  Created by ZhangYu on 2021/7/21.
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
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        func maxDepthImp(_ root: TreeNode?, _ dep: Int) -> Int {
            guard let node = root else { return dep }
            return max(maxDepthImp(node.left, dep + 1), maxDepthImp(node.right, dep + 1))
        }
        return maxDepthImp(root, 0)
    }
}
