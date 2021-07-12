//
//  19. 删除链表的倒数第 N 个结点.swift
//
//
//  Created by yuzhang on 2021/7/12.
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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var fast = head
        var slow = head
        var i = -1
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
            i += 1
            if i == n {
                slow = head
            }
        }
        if i + 1 == n { return head?.next }
        slow?.next = slow?.next?.next
        return head
    }
}
