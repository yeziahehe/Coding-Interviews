//
//  07. 重建二叉树.swift
//  Coding-Interviews
//
//  Created by 叶帆 on 2020/6/4.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 输入某二叉树的前序遍历和中序遍历的结果，请重建该二叉树。假设输入的前序遍历和中序遍历的结果中都不含重复的数字。

  

 例如，给出

 前序遍历 preorder = [3,9,20,15,7]
 中序遍历 inorder = [9,3,15,20,7]
 返回如下的二叉树：

     3
    / \
   9  20
     /  \
    15   7
  

 限制：

 0 <= 节点个数 <= 5000

  

 注意：本题与主站 105 题重复：https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/zhong-jian-er-cha-shu-lcof
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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard !preorder.isEmpty else {
            return nil
        }
        let root = TreeNode(preorder.first!)
        let index = inorder.firstIndex(of: preorder.first!)!
        root.left = buildTree(index.distance(to: 0) < 0 ? Array(preorder[1...index]) : [], index.distance(to: 0) < 0 ? Array(inorder[0...index]) : [])
        root.right = buildTree(index.distance(to: preorder.count) > 0 ? Array(preorder[index+1..<preorder.count]) : [], index.distance(to: inorder.count) > 0 ? Array(inorder[index+1..<inorder.count]) : [])
        return root
    }
}
