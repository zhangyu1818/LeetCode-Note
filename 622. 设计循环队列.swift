//
//  622. 设计循环队列.swift
//  
//
//  Created by ZhangYu on 2021/7/6.
//

// 如果用 count来判断队空队满就好做不少
class MyCircularQueue {
    var queue:[Int]
    var queueSize:Int
    var front = 0
    var rear:Int {(front + count) % queueSize}
    var count:Int = 0
    init(_ k: Int) {
        queueSize = k
        queue = [Int](repeating: 0, count: k)
    }
    
    func enQueue(_ value: Int) -> Bool {
        if isFull() {return false}
        queue[rear] = value
        count += 1
        return true
    }
    
    func deQueue() -> Bool {
        if isEmpty() {return false}
        front = (front + 1) % queueSize
        count -= 1
        return true
    }
    
    func Front() -> Int {
        if isEmpty() { return -1}
        return queue[front]
    }
    
    func Rear() -> Int {
        if isEmpty() { return -1}
        return queue[(front + count - 1) % queueSize]
    }
    
    func isEmpty() -> Bool {
        count == 0
    }
    
    func isFull() -> Bool {
        count == queueSize
    }
}

/**
 * Your MyCircularQueue object will be instantiated and called as such:
 * let obj = MyCircularQueue(k)
 * let ret_1: Bool = obj.enQueue(value)
 * let ret_2: Bool = obj.deQueue()
 * let ret_3: Int = obj.Front()
 * let ret_4: Int = obj.Rear()
 * let ret_5: Bool = obj.isEmpty()
 * let ret_6: Bool = obj.isFull()
 */
