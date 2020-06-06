//
//  13. 机器人的运动范围.swift
//  Coding-Interviews
//
//  Created by 叶帆 on 2020/6/6.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 地上有一个m行n列的方格，从坐标 [0,0] 到坐标 [m-1,n-1] 。一个机器人从坐标 [0, 0] 的格子开始移动，它每次可以向左、右、上、下移动一格（不能移动到方格外），也不能进入行坐标和列坐标的数位之和大于k的格子。例如，当k为18时，机器人能够进入方格 [35, 37] ，因为3+5+3+7=18。但它不能进入方格 [35, 38]，因为3+5+3+8=19。请问该机器人能够到达多少个格子？

  

 示例 1：

 输入：m = 2, n = 3, k = 1
 输出：3
 示例 2：

 输入：m = 3, n = 1, k = 0
 输出：1
 提示：

 1 <= n,m <= 100
 0 <= k <= 20

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ji-qi-ren-de-yun-dong-fan-wei-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    // DFS+剪枝 O(mn)
    var m: Int = 0
    var n: Int = 0
    var k: Int = 0
    var visited: [[Bool]] = []
    func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
        self.m = m
        self.n = n
        self.k = k
        self.visited = Array(repeating: Array(repeating: false, count: n), count: m)
        return dfs(0, 0, 0, 0)
    }

    func dfs(_ i: Int, _ j: Int, _ si: Int, _ sj: Int) -> Int {
        // 终止条件
        // ① 行列索引越界 或 ② 数位和超出目标值 k 或 ③ 当前元素已访问过 时，返回 0 ，代表不计入可达解。
        if i >= m || j >= n || si + sj > k || visited[i][j] {
            return 0
        }
        // 将索引 (i, j) 存入 Set visited 中，代表此单元格已被访问过。
        visited[i][j] = true
        // 计算当前元素的 下、右 两个方向元素的数位和，并开启下层递归 。
        return 1 + dfs(i + 1, j, (i + 1) % 10 != 0 ? si + 1 : si - 8, sj) + dfs(i, j + 1, si, (j + 1) % 10 != 0 ? sj + 1 : sj - 8)
    }
}
