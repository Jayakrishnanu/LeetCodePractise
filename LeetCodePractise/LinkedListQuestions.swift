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
            nodeArray.append(node.value)
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
            if current?.value == val {
                previous?.next?.next = current?.next
                head = previous == nil ? current?.next : head
            } else {
                previous = current
            }
            current = current?.next
        }
        return head
    }
    
    //Leet: 92
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        guard left < right else { return head }
        var beforeLeft: ListNode?
        var leftNode: ListNode?
        var afterRight: ListNode?
        var rightNode: ListNode?
        
        var current = head
        var prev: ListNode?
        var i = 1
        while current != nil {
            if i == left {
                leftNode = current
                beforeLeft = prev
            } else if i > left && i <= right {
                current!.next = prev
            } else if i == right {
                rightNode = current
                afterRight = current!.next
            }
            prev = current
            current = current!.next
            i += 1
        }
        leftNode?.next = afterRight
        beforeLeft?.next = rightNode
        return left == 1 ? rightNode : head
    }
    
    // Leet: 3063
    func frequenciesOfElements(_ head: ListNode?) -> ListNode? {
        var freq: [Int: Int] = [:]
        var node = head
        
        while node != nil {
            freq[node!.value, default: 0] += 1
            node = node!.next
        }
        
        let _ = freq.values.reduce(head) { node, val in
            node!.next = ListNode(value: val)
            return node!.next
        }
        return head!.next
    }
    
    
}
