//
//  141. 环形链表.swift
//  
//
//  Created by ZhangYu on 2021/7/4.
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

// 快慢指针
class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        repeat{
            slow = slow?.next
            fast = fast?.next?.next
            if slow == nil || fast == nil {
                return false
            }
        }while slow !== fast
        return true
    }
}

/*
 Swift里没实现Hashable我不会啊，js的简单方法凑个数
 var hasCycle = function(head) {
     const map = new Map
     while(head !== null){
         if (map.has(head)) return true
         map.set(head,null)
         head = head.next
     }
     return false
 };
 */
