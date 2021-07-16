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

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if k == 0 || head?.next == nil { return head }
        var node = head
        var length = 1
        while let next = node?.next {
            node = next
            length += 1
        }
        let i = length - k % length
        node?.next = head
        for _ in 0 ..< i {
            node = node?.next
        }
        let res = node?.next
        node?.next = nil
        return res
    }
}
