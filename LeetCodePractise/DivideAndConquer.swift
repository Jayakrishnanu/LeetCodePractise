//
//  DivideAndConquer.swift
//  LeetCodePractise
//
//  Created by Jayakrishnan u on 9/7/24.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}



public class DivideAndConquer {
    
    public typealias TreeNode = BinaryNode<Int>
    
    public func sortedArrayToBST(_ nums: [Int]) -> TreeNode?  {
        func helper(_ nums: [Int], _ lo: Int, _ hi: Int) -> TreeNode? {
            guard lo <= hi else { return nil }
            let mid = lo + hi / 2
            let root = TreeNode(value: nums[mid])
            root.leftChild = helper(nums, lo, mid - 1)
            root.rightChild = helper(nums, mid + 1, hi)
            return root
        }
        return helper(nums, 0, nums.count - 1)
    }
    
    public func sortList(_ head: ListNode?) -> ListNode? {
        var tail = ListNode(-1)
        var nextSublist: ListNode? = ListNode(-1)
        var start = head
        let dummy = ListNode(-1)
        
        var size = 1
        let n = getCount(head)
        
        while size < n {
            tail = dummy
            while start != nil {
                guard start?.next != nil else {
                    tail.next = start
                    break
                }
                
                var mid = split(start, size)
                merge(&start, &mid)
                start = nextSublist
            }
            start = dummy.next
            
            size *= 2
        }
        
        return dummy.next
        
        
        func split(_ start: ListNode?, _ size: Int) -> ListNode? {
            var start = start
            var end = start?.next
            
            for _ in 1..<size {
                if let endNext = end?.next { end = endNext.next ?? endNext }
                if let startNext = start?.next { start = startNext }
            }
            let mid = start?.next
            start?.next = nil
            nextSublist = end?.next
            end?.next = nil
            
            return mid
        }
        
        
        func merge(_ list1: inout ListNode?, _ list2: inout ListNode?) {
            let dummy = ListNode(-1)
            var newTail: ListNode? = dummy
            
            while let list1Val = list1?.val, let list2Val = list2?.val {
                if list1Val < list2Val {
                    newTail?.next = list1
                    list1 = list1?.next
                } else {
                    newTail?.next = list2
                    list2 = list2?.next
                }
                newTail = newTail?.next
            }
            newTail?.next = list1 != nil ? list1 : list2
            while newTail?.next != nil { newTail = newTail?.next }
            tail.next = dummy.next
            if let newTail = newTail { tail = newTail }
        }
        
        
        func getCount(_ head: ListNode?) -> Int {
            var count = 0
            var cur = head
            while cur != nil {
                cur = cur?.next
                count += 1
            }
            return count
        }
    }
    
    
    
}
