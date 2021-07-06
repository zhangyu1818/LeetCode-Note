//
//  144. 二叉树的前序遍历.swift
//
//
//  Created by ZhangYu on 2021/7/6.
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

// 递归
class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let node = root else { return [Int]() }
        var result = [node.val]
        result.append(contentsOf: preorderTraversal(node.left))
        result.append(contentsOf: preorderTraversal(node.right))
        return result
    }
}

// 迭代
class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var node = root
        var result = [Int]()
        var stack = [TreeNode]()
        while !stack.isEmpty || node != nil {
            while let current = node {
                result.append(current.val)
                stack.append(current)
                node = current.left
            }
            node = stack.removeLast()
            node = node?.right
        }
        return result
    }
}
