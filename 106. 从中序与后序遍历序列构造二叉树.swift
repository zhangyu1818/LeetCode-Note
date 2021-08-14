//
//  106. 从中序与后序遍历序列构造二叉树.swift
//  106. 从中序与后序遍历序列构造二叉树
//
//  Created by ZhangYu on 2021/8/14.
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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var postIndex = postorder.count - 1
        var map = [Int: Int]()
        for (index, value) in inorder.enumerated() {
            map[value] = index
        }
        func helper(_ inLeft: Int, _ inRight: Int) -> TreeNode? {
            if inLeft > inRight {
                return nil
            }
            let rootValue = postorder[postIndex]
            let valueInOrderIndex = map[rootValue]!

            postIndex -= 1

            var node = TreeNode(rootValue)
            // 必须先从右树构建
            node.right = helper(valueInOrderIndex + 1, inRight)
            node.left = helper(inLeft, valueInOrderIndex - 1)

            return node
        }
        return helper(0, postIndex)
    }
}
