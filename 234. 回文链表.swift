//
//  234. 回文链表.swift
//
//
//  Created by ZhangYu on 2021/7/12.
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

// 递归本来是一个栈，到链表尾的时候依次弹出，等于反向遍历，设置一个全局head正向遍历对比
class Solution {
    var head: ListNode?

    func isSame(_ node: ListNode?) -> Bool {
        guard let current = node else { return true }
        let result = isSame(current.next)
        if !result || head!.val != current.val { return false }
        head = head!.next
        return true
    }

    func isPalindrome(_ head: ListNode?) -> Bool {
        self.head = head!
        return isSame(head)
    }
}
