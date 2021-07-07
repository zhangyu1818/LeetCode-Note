//
//  145. 二叉树的后序遍历.swift
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

// 递归
class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        if let left = root?.left {
            result.append(contentsOf: postorderTraversal(left))
        }
        if let right = root?.right {
            result.append(contentsOf: postorderTraversal(right))
        }
        if let current = root {
            result.append(current.val)
        }
        return result
    }
}

// 递归
class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var stack = [TreeNode]()
        var prev: TreeNode?
        var node = root
        while !stack.isEmpty || node != nil {
            while let current = node {
                stack.append(current)
                node = current.left
            }
            node = stack.removeLast()
            if node!.right == nil || node!.right === prev {
                result.append(node!.val)
                prev = node
                node = nil
            } else {
                stack.append(node!)
                node = node!.right
            }
        }
        return result
    }
}
