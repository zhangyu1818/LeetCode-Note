//
//  21. 合并两个有序链表.swift
//
//
//  Created by ZhangYu on 2021/7/3.
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

// 迭代
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var newListNode: ListNode?
        var head: ListNode?
        var p1 = l1
        var p2 = l2
        while p1 != nil, p2 != nil {
            var v = -1
            if p1!.val < p2!.val {
                v = p1!.val
                p1 = p1!.next
            } else {
                v = p2!.val
                p2 = p2?.next
            }
            if newListNode == nil {
                newListNode = ListNode(v)
                head = newListNode
            } else {
                newListNode!.next = ListNode(v)
                newListNode = newListNode!.next
            }
        }
        if newListNode == nil {
            newListNode = p1 ?? p2
            head = newListNode
        } else {
            newListNode?.next = p1 ?? p2
        }
        return head
    }
}

// 递归（这是简单难度？？？😵‍💫）
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let p1 = l1 else { return l2 }
        guard let p2 = l2 else { return l1 }
        if p1.val > p2.val {
            p2.next = mergeTwoLists(p1, p2.next)
            return p2
        } else {
            p1.next = mergeTwoLists(p1.next, p2)
            return p1
        }
    }
}
