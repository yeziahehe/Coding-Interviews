//
//  33. 二叉搜索树的后序遍历序列.swift
//  Coding-Interviews
//
//  Created by 叶帆 on 2020/6/17.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历结果。如果是则返回 true，否则返回 false。假设输入的数组的任意两个数字都互不相同。

  

 参考以下这颗二叉搜索树：

      5
     / \
    2   6
   / \
  1   3
 示例 1：

 输入: [1,6,3,2,5]
 输出: false
 示例 2：

 输入: [1,3,2,6,5]
 输出: true
  

 提示：

 数组长度 <= 1000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-hou-xu-bian-li-xu-lie-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func verifyPostorder(_ postorder: [Int]) -> Bool {
        return recur(postorder, i: 0, j: postorder.count - 1)
    }

    func recur(_ postorder: [Int], i: Int, j: Int) -> Bool {
        /**
         终止条件： 当 i≥j ，说明此子树节点数量 ≤1 ，无需判别正确性，因此直接返回 true ；
         */
        if i >= j {
            return true
        }
        /**
         递推工作：
         划分左右子树： 遍历后序遍历的 [i,j] 区间元素，寻找 第一个大于根节点 的节点，索引记为 m 。此时，可划分出左子树区间 [i,m−1] 、右子树区间 [m,j−1] 、根节点索引 j 。
         */
        var p = i
        while postorder[p] < postorder[j] {
            p += 1
        }
        let m = p
        /**
         判断是否为二叉搜索树：
         左子树区间 [i,m−1] 内的所有节点都应 < postorder[j] 。而第 1.划分左右子树 步骤已经保证左子树区间的正确性，因此只需要判断右子树区间即可。
         右子树区间 [m,j−1] 内的所有节点都应 > postorder[j] 。实现方式为遍历，当遇到 ≤postorder[j] 的节点则跳出；则可通过 p=j 判断是否为二叉搜索树。
        */
        while postorder[p] > postorder[j] {
            p += 1
        }
        return p == j && recur(postorder, i: i, j: m - 1) && recur(postorder, i: m, j: j - 1)
    }
}
