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

/*
 递归和迭代混合的奇怪解法
 如果当前节点有child，则将child接在当前节点后，在遍历child链表，将原石next接在child链表后
 然后递归分离next
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
