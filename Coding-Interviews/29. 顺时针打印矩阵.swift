//
//  29. 顺时针打印矩阵.swift
//  Coding-Interviews
//
//  Created by 叶帆 on 2020/6/16.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**

 输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字。

  

 示例 1：

 输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
 输出：[1,2,3,6,9,8,7,4,5]
 示例 2：

 输入：matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
 输出：[1,2,3,4,8,12,11,10,9,5,6,7]
  

 限制：

 0 <= matrix.length <= 100
 0 <= matrix[i].length <= 100
 注意：本题与主站 54 题相同：https://leetcode-cn.com/problems/spiral-matrix/
 */
import Foundation

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.isEmpty {
            return []
        }
        var l = 0
        var t = 0
        var r = matrix[0].count - 1
        var b = matrix.count - 1
        var res: [Int] = []
        while true {
            for i in l...r {
                res.append(matrix[t][i]) // left to right
            }
            if t + 1 > b {
                break
            } else {
                t += 1
            }
            for i in t...b {
                res.append(matrix[i][r]) // top to bottom
            }
            if l > r - 1 {
                break
            } else {
                r -= 1
            }
            for i in (l...r).reversed() {
                res.append(matrix[b][i]) // right to left
            }
            if t > b - 1 {
                break
            } else {
                b = b - 1
            }
            for i in (t...b).reversed() {
                res.append(matrix[i][l]) // bottom to top
            }
            if l + 1 > r {
                break
            } else {
                l += 1
            }
        }
        return res
    }
}
