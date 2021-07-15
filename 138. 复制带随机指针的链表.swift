//
//  138. 复制带随机指针的链表.swift
//
//
//  Created by yuzhang on 2021/7/15.
//

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public var random: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *           self.random = nil
 *     }
 * }
 */

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        var node = head
        while let current = node {
            let newNode = Node(current.val)
            newNode.random = current.random
            newNode.next = current.next
            current.next = newNode
            node = newNode.next
        }
        node = head?.next
        while let current = node {
            current.random = current.random?.next
            node = current.next?.next
        }
        var originHead = head
        var copyHead = head?.next
        node = copyHead
        while originHead != nil {
            originHead?.next = originHead?.next?.next
            copyHead?.next = copyHead?.next?.next
            copyHead = copyHead?.next
            originHead = originHead?.next
        }
        return node
    }
}
