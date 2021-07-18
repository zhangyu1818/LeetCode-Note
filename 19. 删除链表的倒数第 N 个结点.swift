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

/*
 双指针方法求解
 快指针多走n步，当快指针走完链表的时候，慢指针指向的就是需要被删除的链表
 由于单向链表，所以实际求解中快指针需要多走n+1步，这样慢指针指向的就是需要被删除节点的上一个节点
 */
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var fast = head
        var slow = head
        // 多走1步
        var i = -1
        // 快指针没有走完链表
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
            i += 1
            // 快指针多走了n步以后，慢指针才开始走
            if i == n {
                slow = head
            }
        }
        // 边界条件判断是否删除的为第一个节点
        // i + 1为链表长度
        if i + 1 == n { return head?.next }
        slow?.next = slow?.next?.next
        return head
    }
}
