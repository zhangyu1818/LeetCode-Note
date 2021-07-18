//
//  2. 两数相加.swift
//
//
//  Created by ZhangYu on 2021/7/13.
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
 递归方式相加
 终止条件为两条链表的下一个节点都为nil
 由于两条链表长度可能不同，为nil的链表默认值需要为0
 当前节点相加后，求余 sum % 10为当前节点值， 是否有进位判断则是商 sum / 10
 终止条件额外需要判断最后一位是否有进位，有则新增一个值为1的节点 A: [1,1,9] B: [1,1,2] => [2,2,1,1]
 */
class Solution {
    func add(_ l1: ListNode?, _ l2: ListNode?, _ node: ListNode, _ needCarry: Bool) {
        // 下轮相加的节点
        let l1Next = l1?.next
        let l2Next = l2?.next
        // 当前节点的值，为nil则为0
        let l1Value = l1?.val ?? 0
        let l2Value = l2?.val ?? 0
        // 当前节点相加的和
        var sum = l1Value + l2Value

        // 如果上轮节点相加进位，则和加1
        if needCarry {
            sum += 1
        }

        // 求商和余
        let (quotient, remainder) = sum.quotientAndRemainder(dividingBy: 10)
        // 相加后的结果为余
        node.val = remainder

        // 有商则下轮需要进位
        let nextNeedCarry = quotient == 1
        // 下轮节点都不为nil，继续递归
        if l1Next !== nil || l2Next !== nil {
            node.next = ListNode()
            add(l1Next, l2Next, node.next!, nextNeedCarry)
        } else if nextNeedCarry {
            // 下轮节点为nil，并且下轮需要进位
            node.next = ListNode(1)
        }
    }

    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let head = ListNode()
        add(l1, l2, head, false)
        return head
    }
}
