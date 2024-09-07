//
//  LinkedListQuestions.swift
//  LeetCodePractise
//
//  Created by Jayakrishnan u on 9/6/24.
//

import Foundation

public class LinkedListQuestions {
    
    public init() { }
    
    public typealias ListNode = Node<Int>
    
    // Leet: 2 Medium
    
    public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        let dummyHead = ListNode(-1)
        var carry = 0
        var tail: ListNode? = dummyHead
        
        while l1 != nil || l2 != nil || carry != 0 {
            var sum = carry
            if let l1Val = l1?.val {
                sum += l1Val
            }
            
            if let l2Val = l2?.val {
                sum += l2Val
            }
            
            let digit = sum % 10
            carry = sum / 10
            tail?.next = ListNode(digit)
            tail = tail?.next
            l1 = l1?.next
            l2 = l2?.next
        }
        return dummyHead
    }
    
    // Leet: 19 Medium
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var fast = head
        var slow = head
        var count = n
        while count > 0  {
            fast = fast?.next
            count -= 1
        }
        if fast == nil { return head?.next }
        
        while slow != nil && fast != nil {
            if fast?.next == nil {
                slow?.next = slow?.next?.next
            }
            slow = slow?.next
            fast = fast?.next
        }
        return head
    }
    
    // Leet: 21 Easy
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil { return list2 }
        if list2 == nil { return list1 }
        if list1!.val < list2!.val {
            list1!.next = mergeTwoLists(list1, list2)
            return list1
        } else {
            list2!.next = mergeTwoLists(list2, list1)
            return list2
        }
    }
    
    // Leet: 61
    
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head?.next != nil else { return head }
        var current = head
        var count = 1
        
        while current?.next != nil {
            current = current?.next
            count += 1
        }
        current?.next = head
        for _ in 0..<(count - k %  count) {
            current = current?.next
        }
        let newHead = current?.next
        current?.next = nil
        return newHead
    }
    
    // Leet: 82
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummy: ListNode? = ListNode(-1)
        dummy?.next = head
        var current = dummy
        
        while let nextVal = current?.next?.val, let nextNextVal = current?.next?.next?.val {
            if nextVal == nextNextVal {
                let duplicate = nextVal
                while current?.next != nil && current?.next?.val == duplicate {
                    current?.next = current?.next?.next
                }
            } else {
                current = current?.next
            }
        }
        return dummy?.next
    }
    
    // Leet: 86 Medium
    
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let current = head
        var look = head
        
        while look != nil {
            if let value = look?.val, value < x {
                let node = ListNode(value)
                node.next = current?.next?.next
                current?.next = node
                look = look?.next?.next
                
            } else {
                look = look?.next
            }
        }
        return current
    }
    
    // Leet: 92 Medium
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        let left_head = head
        var left_tail: ListNode?
        var current = head
        var index = 1
        
        while index < left {
            left_tail = current
            current = current?.next
            index += 1
        }
        
        var mid_tail = current
        var node0: ListNode? = current
        var node1: ListNode? = node0?.next
        var node2: ListNode? = node1?.next
        
        while index < right {
            node1?.next = node0
            node0 = node1
            node1 = node2
            node2 = node2?.next
            index += 1
        }
        
        if left_tail == nil {
            mid_tail?.next = node1
            return node0
        } else {
            left_tail?.next = node0
            mid_tail?.next = node1
            return left_head
        }
    }
    
    // Leet: 141 Easy
    public func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head?.next
        while slow != nil || fast != nil {
            guard slow !== fast else { return true }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return false
    }
    
    // Leet: 142 Medium
    
    public func detectCycle(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else { return nil }
        var slow = head
        var fast = head
        
        while slow?.next != nil || fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            guard slow !== fast else { break }
        }
        
        slow = head
        while slow !== fast {
            slow = slow?.next
            fast = fast?.next
        }
        return slow
    }
    
    // Leet: 206 Easy
    public func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        var current = head
        while let node = current {
            current = node.next
            node.next = prev
            prev = node
        }
        return prev
    }
    
    // Leet: 234 Easy
    public func isPaliandrome(_ head: ListNode?) -> Bool {
        var nodeArray: [Int] = []
        var head = head
        while let node = head {
            nodeArray.append(node.val)
            head = head?.next
        }
        var i = 0, j = nodeArray.count - 1
        while i <= j {
            if nodeArray[i] != nodeArray[j] {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
    
    // Leet: 203 Easy
    public func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var head = head
        var previous: ListNode?
        var current = head
        
        while current != nil {
            if current?.val == val {
                previous?.next?.next = current?.next
                head = previous == nil ? current?.next : head
            } else {
                previous = current
            }
            current = current?.next
        }
        return head
    }
    
    // Leet: 3063
    func frequenciesOfElements(_ head: ListNode?) -> ListNode? {
        var freq: [Int: Int] = [:]
        var node = head
        
        while node != nil {
            freq[node!.val, default: 0] += 1
            node = node!.next
        }
        
        let _ = freq.values.reduce(head) { node, val in
            node!.next = ListNode(val)
            return node!.next
        }
        return head!.next
    }
    
    
}
