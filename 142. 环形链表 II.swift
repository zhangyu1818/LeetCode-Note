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

/*
 快慢指针求解
 难点在于相遇后如何找到入环节点，复制leetcode评论区大佬的解释
 slow * 2 = fast;
 slow = a + b;
 fast = a + b + c + b = a + 2*b + c;
 (a + b)*2 = a + 2*b + c;
 a = c;
 快针走的是慢针的两倍。
 慢针走过的路，快针走过一遍。
 快针走过的剩余路程，也就是和慢针走过的全部路程相等。(a+b = c+b)
 刨去快针追赶慢针的半圈(b)，剩余路程即为所求入环距离(a=c)
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
