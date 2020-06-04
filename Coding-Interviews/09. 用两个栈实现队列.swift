//
//  09. 用两个栈实现队列.swift
//  Coding-Interviews
//
//  Created by 叶帆 on 2020/6/4.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 用两个栈实现一个队列。队列的声明如下，请实现它的两个函数 appendTail 和 deleteHead ，分别完成在队列尾部插入整数和在队列头部删除整数的功能。(若队列中没有元素，deleteHead 操作返回 -1 )

  

 示例 1：

 输入：
 ["CQueue","appendTail","deleteHead","deleteHead"]
 [[],[3],[],[]]
 输出：[null,null,3,-1]
 示例 2：

 输入：
 ["CQueue","deleteHead","appendTail","appendTail","deleteHead","deleteHead"]
 [[],[],[5],[2],[],[]]
 输出：[null,-1,null,null,5,2]
 提示：

 1 <= values <= 10000
 最多会对 appendTail、deleteHead 进行 10000 次调用

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/yong-liang-ge-zhan-shi-xian-dui-lie-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Stack {
    private var array = [Int]()
    
    func push(x: Int) {
        array.append(x)
    }
    
    func pop() -> Int {
        return array.removeLast()
    }
    
    func empty() -> Bool {
        return array.isEmpty
    }

    func top() -> Int {
        return array.last ?? -1
    }
}

class CQueue {
    private var temp = Stack()
    private var stack = Stack()

    init() {

    }
    
    func appendTail(_ value: Int) {
        while !stack.empty() {
            temp.push(x: stack.pop())
        }
        stack.push(x: value)
        while !temp.empty() {
            stack.push(x: temp.pop())
        }
    }
    
    func deleteHead() -> Int {
        guard !stack.empty() else {
            return -1
        }
        return stack.pop()
    }
}

/**
 * Your CQueue object will be instantiated and called as such:
 * let obj = CQueue()
 * obj.appendTail(value)
 * let ret_2: Int = obj.deleteHead()
 */
