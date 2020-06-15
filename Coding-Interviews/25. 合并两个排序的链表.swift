//
//  25. 合并两个排序的链表.swift
//  Coding-Interviews
//
//  Created by 叶帆 on 2020/6/15.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 输入两个递增排序的链表，合并这两个链表并使新链表中的节点仍然是递增排序的。

 示例1：

 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 限制：

 0 <= 链表长度 <= 1000

 注意：本题与主站 21 题相同：https://leetcode-cn.com/problems/merge-two-sorted-lists/

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/he-bing-liang-ge-pai-xu-de-lian-biao-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let head: ListNode? = ListNode(-1)
        var node: ListNode? = head
        var l1 = l1
        var l2 = l2
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                node?.next = l1
                l1 = l1?.next
            } else {
                node?.next = l2
                l2 = l2?.next
            }
            node = node?.next
        }
        node?.next = l1 == nil ? l2 : l1
        return head?.next
    }
}
