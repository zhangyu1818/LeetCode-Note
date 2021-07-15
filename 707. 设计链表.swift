//
//  707. 设计链表.swift
//
//
//  Created by yuzhang on 2021/7/13.
//

class Node {
    var next: Node?
    var prev: Node?
    var value: Int
    init(_ value: Int, next: Node? = nil, prev: Node? = nil) {
        self.value = value
        self.next = next
        self.prev = prev
    }
}

class MyLinkedList {
    var head: Node?
    var tail: Node? {
        guard var node = head else { return nil }
        while let next = node.next {
            node = next
        }
        return node
    }

    /** Initialize your data structure here. */
    init() {}

    func getNode(_ index: Int) -> Node? {
        var node = head
        for _ in 0 ..< index {
            node = node?.next
        }
        return node
    }

    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        if let node = getNode(index) {
            return node.value
        }
        return -1
    }

    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        let newNode = Node(val, next: head)
        head?.prev = newNode
        head = newNode
    }

    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        let tailNode = tail
        let newNode = Node(val,prev:tailNode)
        tailNode.next = newNode
    }

    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        guard let currentNode = getNode(index) else {return nil}
        let prevNode = currentNode.prev
        let newNode = Node(val,next:currentNode,prev:prevNode)
        prevNode?.next =
    }

    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {}
}

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */
