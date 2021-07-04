//
//  160. 相交链表 .swift
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

// 短链表 + 长链表
class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var pA = headA
        var pB = headB
        while pA !== pB {
            pA = pA == nil ? headB : pA!.next
            pB = pB == nil ? headA : pB!.next
        }
        return pA
    }
}

/**
 js map硬判断值是否存在
 var getIntersectionNode = function(headA, headB) {
     const map = new Map
     let pA = headA
     let pB = headB
     while(pA !== null){
         map.set(pA,null)
         pA = pA.next
     }
     while(pB !== null){
         if(map.has(pB)){
             return pB
         }
         pB = pB.next
     }
     return null
 };
 */
