//
//  05. 替换空格.swift
//  Coding-Interviews
//
//  Created by 叶帆 on 2020/6/2.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 请实现一个函数，把字符串 s 中的每个空格替换成"%20"。

  

 示例 1：

 输入：s = "We are happy."
 输出："We%20are%20happy."
  

 限制：

 0 <= s 的长度 <= 10000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ti-huan-kong-ge-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func replaceSpace(_ s: String) -> String {
        var ans = ""
        for c in Array(s) {
            ans += c == " " ? "%20" : String(c)
        }
        return ans
//        return s.replacingOccurrences(of: " ", with: "%20")
    }
}
