//
//  10- II. 青蛙跳台阶问题.swift
//  Coding-Interviews
//
//  Created by 叶帆 on 2020/6/4.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。

 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

 示例 1：

 输入：n = 2
 输出：2
 示例 2：

 输入：n = 7
 输出：21
 提示：

 0 <= n <= 100
 注意：本题与主站 70 题相同：https://leetcode-cn.com/problems/climbing-stairs/

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/qing-wa-tiao-tai-jie-wen-ti-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func numWays(_ n: Int) -> Int {
        // f(1) = 1, f(2) = 2
        // f(n) = f(n-1) + f(n-2)
        guard n > 2 else {
            return n == 0 ? 1 : n
        }
        var dp: [Int] = Array(repeating: 0, count: n+1)
        dp[1] = 1
        dp[2] = 2
        for i in 3...n {
            dp[i] = (dp[i-1] + dp[i-2])%1000000007
        }
        return dp[n]
    }
}
