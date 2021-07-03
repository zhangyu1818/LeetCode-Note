//
//  83. 删除排序链表中的重复元素.swift
//
//
//  Created by ZhangYu on 2021/7/4.
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

// 递归求解（我知道它是简单，但是我想了一个小时）
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard var p = head else { return nil }
        while p.val == p.next?.val {
            p.next = p.next?.next
        }
        p.next = deleteDuplicates(p.next)
        return p
    }
}

// 迭代
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard var p = head else { return nil }
        while p.next != nil {
            if p.val == p.next?.val {
                p.next = p.next?.next
            } else {
                p = p.next!
            }
        }
        return head
    }
}
