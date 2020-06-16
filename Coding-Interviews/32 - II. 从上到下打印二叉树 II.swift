//
//  32 - II. 从上到下打印二叉树 II.swift
//  Coding-Interviews
//
//  Created by 叶帆 on 2020/6/16.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 从上到下按层打印二叉树，同一层的节点按从左到右的顺序打印，每一层打印到一行。

  

 例如:
 给定二叉树: [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回其层次遍历结果：

 [
   [3],
   [9,20],
   [15,7]
 ]
  

 提示：

 节点总数 <= 1000
 注意：本题与主站 102 题相同：https://leetcode-cn.com/problems/binary-tree-level-order-traversal/

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-ii-lcof
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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var queue: [TreeNode] = [root]
        var nextQueue: [TreeNode] = []
        var cur: [Int] = []
        var res: [[Int]] = []
        while !queue.isEmpty {
            let node = queue.removeFirst()
            cur.append(node.val)
            if node.left != nil {
                nextQueue.append(node.left!)
            }
            if node.right != nil {
                nextQueue.append(node.right!)
            }
            if queue.isEmpty {
                // 当前行队列已经空了
                res.append(cur)
                cur = []
                queue = nextQueue
                nextQueue = []
            }
        }
        return res
    }
}
