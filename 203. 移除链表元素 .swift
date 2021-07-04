//
//  203. 移除链表元素 .swift
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
// 递归
class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard var p = head else {return nil}
        p.next = removeElements(p.next, val)
        return p.val == val ? p.next : p
    }
}

// 迭代
class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var p = head
        var prev = head
        while p != nil{
            if p?.val == val{
                prev?.next = p?.next
            }else{
                prev = p
            }
            p = p?.next
        }
        return head?.val == val ? head?.next : head
    }
}
