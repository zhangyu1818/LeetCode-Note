//
//  102. 二叉树的层序遍历.swift
//
//
//  Created by ZhangYu on 2021/7/9.
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

/*
 每一次循环将下一层的节点都加入队列
 那么下轮循环时，队列里只有下一层的节点
 */
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        guard let node = root else { return result }
        var queue = [node]
        while !queue.isEmpty {
            var level = [Int]()
            for _ in 0 ..< queue.count {
                let current = queue.removeFirst()
                if let left = current.left {
                    queue.append(left)
                }
                if let right = current.right {
                    queue.append(right)
                }
                level.append(current.val)
            }
            result.append(level)
        }
        return result
    }
}
