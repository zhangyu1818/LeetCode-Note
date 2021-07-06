//
//  142. 环形链表 II.swift
//  
//
//  Created by ZhangYu on 2021/7/7.
//

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        repeat{
            slow = slow?.next
            fast = fast?.next?.next
        }while slow !== fast

        if slow == nil || fast == nil { return nil}

        var node = head
        while slow !== node{
            slow = slow?.next
            node = node?.next
        }
        
        return slow
    }
}
