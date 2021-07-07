//
//  94. 二叉树的中序遍历.swift
//
//
//  Created by yuzhang on 2021/7/7.
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

// 递归 和前序遍历的区别是在遍历了left后在添加当前节点值
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        if let left = root?.left {
            result.append(contentsOf: inorderTraversal(left))
        }
        if let node = root {
            result.append(node.val)
        }
        if let right = root?.right {
            result.append(contentsOf: inorderTraversal(right))
        }
        return result
    }
}

// 迭代
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var stack = [TreeNode]()
        var node = root
        while !stack.isEmpty || node != nil {
            while let current = node {
                stack.append(current)
                node = current.left
            }
            node = stack.removeLast()
            if let current = node {
                result.append(current.val)
            }
            node = node?.right
        }
        return result
    }
}
