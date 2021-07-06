//
//  346. 数据流中的移动平均值.swift
//  
//
//  Created by ZhangYu on 2021/7/6.
//

// 入队出队保证不越界再除size
class MovingAverage {
    var maxSize:Int
    var queue = [Int]()
    /** Initialize your data structure here. */
    init(_ size: Int) {
        maxSize = size
    }
    
    func next(_ val: Int) -> Double {
        queue.append(val)
        if queue.count > maxSize {
            queue.removeFirst()
        }
        return Double(queue.reduce(0){r,c in
            r + c
        }) / Double(queue.count)
    }
}

/**
 * Your MovingAverage object will be instantiated and called as such:
 * let obj = MovingAverage(size)
 * let ret_1: Double = obj.next(val)
 */
