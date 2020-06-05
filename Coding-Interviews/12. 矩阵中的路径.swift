//
//  12. 矩阵中的路径.swift
//  Coding-Interviews
//
//  Created by 叶帆 on 2020/6/5.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 请设计一个函数，用来判断在一个矩阵中是否存在一条包含某字符串所有字符的路径。路径可以从矩阵中的任意一格开始，每一步可以在矩阵中向左、右、上、下移动一格。如果一条路径经过了矩阵的某一格，那么该路径不能再次进入该格子。例如，在下面的3×4的矩阵中包含一条字符串“bfce”的路径（路径中的字母用加粗标出）。

 [["a","b","c","e"],
 ["s","f","c","s"],
 ["a","d","e","e"]]

 但矩阵中不包含字符串“abfb”的路径，因为字符串的第一个字符b占据了矩阵中的第一行第二个格子之后，路径不能再次进入这个格子。

  

 示例 1：

 输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
 输出：true
 示例 2：

 输入：board = [["a","b"],["c","d"]], word = "abcd"
 输出：false
 提示：

 1 <= board.length <= 200
 1 <= board[i].length <= 200
 注意：本题与主站 79 题相同：https://leetcode-cn.com/problems/word-search/

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ju-zhen-zhong-de-lu-jing-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    // DFS+剪枝
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if dfs(&board, word, i, j, 0) {
                    return true
                }
            }
        }
        return false
    }
    
    func dfs(_ board: inout [[Character]], _ word: String, _ i: Int, _ j: Int, _ k: Int) -> Bool {
        // 终止条件 返回 false
        // ① 行或列索引越界 或 ② 当前矩阵元素与目标字符不同 或 ③ 当前矩阵元素已访问过
        if i < 0 || i >= board.count || j < 0 || j >= board[0].count || board[i][j] != Array(word)[k] {
            return false
        }
        // 终止条件 返回 true
        // 字符串 word 已全部匹配，即 k = word.count - 1 。
        if k == word.count - 1 {
            return true
        }
        // 标记当前矩阵元素
        // 将 board[i][j] 值暂存于变量 tmp ，并修改为字符 '#' ，代表此元素已访问过，防止之后搜索时重复访问。
        let temp = board[i][j]
        board[i][j] = "#"
        // 搜索下一单元格
        // 朝当前元素的 上、下、左、右 四个方向开启下层递归，使用 或 连接 （代表只需一条可行路径） ，并记录结果至 res 。
        let res = dfs(&board, word, i + 1, j, k + 1) || dfs(&board, word, i, j + 1, k + 1) || dfs(&board, word, i, j - 1, k + 1) || dfs(&board, word, i - 1, j, k + 1)
        // 还原当前矩阵元素
        // 将 tmp 暂存值还原至 board[i][j] 元素。
        board[i][j] = temp
        return res
    }
}
