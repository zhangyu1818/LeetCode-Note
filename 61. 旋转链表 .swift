//
//  61. 旋转链表 .swift
//
//
//  Created by ZhangYu on 2021/7/17.
//

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

/*
 要点在于将链表头尾相接，成为循环链表，这样无论走多少步都能做到在链表里绕圈圈
 移动的k个位置，实际等于k % length，k = length的情况就是原地不动（绕了一周）
 */
class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if k == 0 || head?.next == nil { return head }
        var node = head
        var length = 1
        // 找到最后一个节点，同时计算长度
        while let next = node?.next {
            node = next
            length += 1
        }
        // 当前节点为尾节点
        let i = length - k % length
        // 头尾相接
        node?.next = head
        for _ in 0 ..< i {
            node = node?.next
        }
        let res = node?.next
        node?.next = nil
        return res
    }
}
