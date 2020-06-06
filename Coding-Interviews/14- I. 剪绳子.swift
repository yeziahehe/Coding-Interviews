//
//  14- I. 剪绳子.swift
//  Coding-Interviews
//
//  Created by 叶帆 on 2020/6/6.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给你一根长度为 n 的绳子，请把绳子剪成整数长度的 m 段（m、n都是整数，n>1并且m>1），每段绳子的长度记为 k[0],k[1]...k[m-1] 。请问 k[0]*k[1]*...*k[m-1] 可能的最大乘积是多少？例如，当绳子的长度是8时，我们把它剪成长度分别为2、3、3的三段，此时得到的最大乘积是18。

 示例 1：

 输入: 2
 输出: 1
 解释: 2 = 1 + 1, 1 × 1 = 1
 示例 2:

 输入: 10
 输出: 36
 解释: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36
 提示：

 2 <= n <= 58
 注意：本题与主站 343 题相同：https://leetcode-cn.com/problems/integer-break/

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/jian-sheng-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    // 数学推导：尽可能将绳子以长度 3 等分为多段时，乘积最大。
    /**
     切分规则：
     最优： 3 。把绳子尽可能切为多个长度为 3 的片段，留下的最后一段绳子的长度可能为 0,1,2 三种情况。
     次优： 2 。若最后一段绳子长度为 2 ；则保留，不再拆为 1+1 。
     最差： 1 。若最后一段绳子长度为 1 ；则应把一份 3 + 1 替换为 2 + 2，因为 2×2>3×1。
     */
    func cuttingRope1(_ n: Int) -> Int {
        // 当 n≤3 时，按照规则应不切分，但由于题目要求必须剪成 m>1 段，因此必须剪出一段长度为 1 的绳子，即返回 n−1 。
        if n < 3 {
            return n - 1
        }
        let a = n / 3
        let b = n % 3
        if b == 0 {
            return NSDecimalNumber(decimal: pow(3, a)).intValue
        } else if b == 1 {
            return NSDecimalNumber(decimal: pow(Decimal(3), a - 1) * 4).intValue
        } else {
            return NSDecimalNumber(decimal: pow(3, a) * 2).intValue
        }
    }

    func cuttingRope(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n + 1)
        dp[2] = 1
        for i in 3...n {
            for j in 1..<i {
                dp[i] = max(dp[i], max(dp[i-j] * j, (i - j) * j))
            }
        }
        return dp[n]
    }
}
