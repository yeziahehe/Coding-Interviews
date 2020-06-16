//
//  30. 包含min函数的栈.swift
//  Coding-Interviews
//
//  Created by 叶帆 on 2020/6/16.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 定义栈的数据结构，请在该类型中实现一个能够得到栈的最小元素的 min 函数在该栈中，调用 min、push 及 pop 的时间复杂度都是 O(1)。

  

 示例:

 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.min();   --> 返回 -3.
 minStack.pop();
 minStack.top();      --> 返回 0.
 minStack.min();   --> 返回 -2.
  

 提示：

 各函数的调用总次数不超过 20000 次
  

 注意：本题与主站 155 题相同：https://leetcode-cn.com/problems/min-stack/

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/bao-han-minhan-shu-de-zhan-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class MinStack {

    var a: [Int] = []
    var minA: [Int] = []
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        a.append(x)
        if minA.isEmpty || x <= minA.last! {
            minA.append(x)
        }
    }
    
    func pop() {
        if a.isEmpty {
            return
        }
        let v = a.removeLast()
        if v == minA.last {
            minA.removeLast()
        }
    }
    
    func top() -> Int {
        return a.last ?? 0
    }
    
    func min() -> Int {
        return minA.last ?? 0
    }
}
