//
//  StackPractise.swift
//  LeetCodePractise
//
//  Created by Jayakrishnan u on 9/9/24.
//

import Foundation

public class StackPractise {
    public func removeKdigits(_ num: String, _ k: Int) -> String {
        var count = k
        var stack: [Character] = []
        for number in num {
            while let last = stack.last, number < last, count > 0 {
                stack.removeLast()
                count -= 1
            }
            stack.append(number)
        }
        while count > 0 {
            stack.removeLast()
            count -= 1
        }
        
        while stack.first == "0" {
            stack.removeFirst()
        }
        return stack.isEmpty ? "0" : String(stack)
    }
}
