//
//  04. 二维数组中的查找.swift
//  Coding-Interviews
//
//  Created by 叶帆 on 2020/6/1.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 在一个 n * m 的二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。

  

 示例:

 现有矩阵 matrix 如下：

 [
   [1,   4,  7, 11, 15],
   [2,   5,  8, 12, 19],
   [3,   6,  9, 16, 22],
   [10, 13, 14, 17, 24],
   [18, 21, 23, 26, 30]
 ]
 给定 target = 5，返回 true。

 给定 target = 20，返回 false。

  

 限制：

 0 <= n <= 1000

 0 <= m <= 1000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/er-wei-shu-zu-zhong-de-cha-zhao-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        // 初始化 i 和 j 为数组左下角元素
        var i = matrix.count - 1
        var j = 0
        // 如果 i 和 j 没有越界继续判断
        while i >= 0 && j < matrix[0].count {
            if matrix[i][j] == target {
                return true
            }
            if matrix[i][j] > target {
                // 行索引向上移动一格（即 i-- ），即消去矩阵第 i 行元素
                i -= 1
            } else {
                // 列索引向右移动一格（即 j++ ），即消去矩阵第 j 列元素
                j += 1
            }
        }
        return false
    }
}

/**
 仔细观察矩阵，可以发现：左下角元素 为所在列最大元素，所在行最小元素

 如果 左下角元素 大于了目标值，则目标值一定在该行的上方， 左下角元素所在行可以消去。

 如果 左下角元素 小于了目标值，则目标值一定在该列的右方， 左下角元素所在列可以消去。

 具体操作为从矩阵左下角元素开始遍历，并与目标值对比：

 当 matrix[i][j] > target 时：行索引向上移动一格（即 i--），即消去矩阵第 i 行元素；
 当 matrix[i][j] < target 时：列索引向右移动一格（即 j++），即消去矩阵第 j 列元素；
 当 matrix[i][j] == target 时：返回 true。
 如果越界，则返回 false。
 */
