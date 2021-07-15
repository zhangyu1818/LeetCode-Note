//
//  430. 扁平化多级双向链表.swift
//
//
//  Created by ZhangYu on 2021/7/14.
//

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var prev: Node?
 *     public var next: Node?
 *     public var child: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.prev = nil
 *         self.next = nil
 *         self.child  = nil
 *     }
 * }
 */

class Solution {
    func flat(_ head: Node?) {
        guard let node = head else { return }
        let next = node.next
        if var child = node.child {
            node.child = nil
            node.next = child
            flat(child)
            child.prev = node
            while let childNext = child.next {
                child = childNext
            }
            child.next = next
            next?.prev = child
        }
        flat(next)
    }

    func flatten(_ head: Node?) -> Node? {
        flat(head)
        return head
    }
}
