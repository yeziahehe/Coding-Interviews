//
//  34. 二叉树中和为某一值的路径.swift
//  Coding-Interviews
//
//  Created by 叶帆 on 2020/6/18.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 输入一棵二叉树和一个整数，打印出二叉树中节点值的和为输入整数的所有路径。从树的根节点开始往下一直到叶节点所经过的节点形成一条路径。

  

 示例:
 给定如下二叉树，以及目标和 sum = 22，

               5
              / \
             4   8
            /   / \
           11  13  4
          /  \    / \
         7    2  5   1
 返回:

 [
    [5,4,11,2],
    [5,8,4,5]
 ]
  

 提示：

 节点总数 <= 10000
 注意：本题与主站 113 题相同：https://leetcode-cn.com/problems/path-sum-ii/

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/er-cha-shu-zhong-he-wei-mou-yi-zhi-de-lu-jing-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    var res: [[Int]] = []
    var path: [Int] = []
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        recur(root, sum)
        return res
    }

    func recur(_ root: TreeNode?, _ sum: Int) {
        if root == nil {
            return
        }
        path.append(root!.val)
        let tar = sum - root!.val
        if tar == 0 && root?.left == nil && root?.right == nil {
            res.append(Array(path))
        }
        recur(root?.left, tar)
        recur(root?.right, tar)
        path.removeLast()
    }
}
