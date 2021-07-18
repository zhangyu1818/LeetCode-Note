//
//  328. 奇偶链表.swift
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
 抽离奇节点和偶节点成2条链表
 然后将偶节点接在奇节点后面
 */
class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var oddHead = head
        var evenHead = head?.next
        var even = evenHead
        // 偶节点为nil就到尾了
        while evenHead?.next != nil {
            let oddNext = oddHead!.next?.next
            oddHead!.next = oddNext
            oddHead = oddNext
            let evenNext = evenHead!.next?.next
            evenHead!.next = evenNext
            evenHead = evenNext
        }
        oddHead?.next = even
        return head
    }
}
