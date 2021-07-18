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

/* 快慢指针
 快指针每次走2步，慢指针每次走1步
 如果快指针走完了链表，则表示链表无环
 当快指针追上慢指针，则表示有环
 */
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
 hash方法就是把每个走过的节点都存下来，如果当前节点存在于hashmap里，就表示有环走回来了
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
