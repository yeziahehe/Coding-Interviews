
//
//  28. 对称的二叉树.swift
//  Coding-Interviews
//
//  Created by 叶帆 on 2020/6/16.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 请实现一个函数，用来判断一棵二叉树是不是对称的。如果一棵二叉树和它的镜像一样，那么它是对称的。

 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。

     1
    / \
   2   2
  / \ / \
 3  4 4  3
 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:

     1
    / \
   2   2
    \   \
    3    3

  

 示例 1：

 输入：root = [1,2,2,3,4,4,3]
 输出：true
 示例 2：

 输入：root = [1,2,2,null,3,null,3]
 输出：false
  

 限制：

 0 <= 节点个数 <= 1000

 注意：本题与主站 101 题相同：https://leetcode-cn.com/problems/symmetric-tree/

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/dui-cheng-de-er-cha-shu-lcof
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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        /**
         特例处理： 若根节点 root 为空，则直接返回 true 。
         返回值： 即 recur(root.left, root.right) ;
         */
        return root == nil ? true : recur(root?.left, root?.right)
    }

    func recur(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        /**
         终止条件：
         当 L 和 R 同时越过叶节点： 此树从顶至底的节点都对称，因此返回 true ；
         当 L 或 R 中只有一个越过叶节点： 此树不对称，因此返回 false ；
         当节点 L 值 \= 节点 R 值： 此树不对称，因此返回 false ；
         递推工作：
         判断两节点 L.left 和 R.right 是否对称，即 recur(L.left, R.right) ；
         判断两节点 L.right 和 R.left 是否对称，即 recur(L.right, R.left) ；
         返回值： 两对节点都对称时，才是对称树，因此用与逻辑符 && 连接。
         */
        if left == nil && right == nil {
            return true
        }
        if left == nil || right == nil || left?.val != right?.val {
            return false
        }
        return recur(left?.left, right?.right) && recur(left?.right, right?.left)
    }
}
