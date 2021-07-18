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

/*
 遍历链表，每个节点后面都复制一个当前节点
 最后从头抽离，.next.next就能够取到复制的节点组成的链表
 */
class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        var node = head
        // 复制当前节点，链接到当前节点后面
        while let current = node {
            let newNode = Node(current.val)
            newNode.random = current.random
            newNode.next = current.next
            current.next = newNode
            node = newNode.next
        }
        // 指向复制的节点头
        node = head?.next
        while let current = node {
            // 如果复制的节点有random，则指向的原始节点random，将它改为random.next就是复制的random节点
            current.random = current.random?.next
            node = current.next?.next
        }
        var originHead = head
        var copyHead = head?.next
        node = copyHead
        // 分离两条链表
        while originHead != nil {
            originHead?.next = originHead?.next?.next
            copyHead?.next = copyHead?.next?.next
            copyHead = copyHead?.next
            originHead = originHead?.next
        }
        return node
    }
}
